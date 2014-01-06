/* 
* @Author: Gowiem
* @Date:   2013-12-17 14:21:17
*/

var Hist = Hist || {};

Hist.TimelineUtils = (function() {
  
  // Note: The following method uses memoization so it doesn't need to recalculate
  // the range for a year that it has already seen. This is definitely overkill, but
  // I felt like doing this. :)
  var rangeMemo = {};
  var pubFindRange = function(year, mod) {
    var result = rangeMemo[year],
        remainder,
        rangeBegin,
        rangeEnd;
    // If we haven't seen the given year yet then continue and find the range.
    if (!result) {
      remainder = year % mod;
      // Find the rangeBegin by using the remainder to determine if we need to start at xxx5 or xxx0
      rangeBegin = remainder <= 5 ? year - remainder : year - remainder + 5;
      rangeEnd = rangeBegin + 5;

      result = [rangeBegin, rangeEnd];
      rangeMemo[year] = result; // Memoize the result so we don't have to do this again.
    }

    return result;
  }

  var pubRoundToDecade = function(date, shouldFloor) {
    var year = date.getFullYear(),
        remainder = year % 10,
        roundedYear = shouldFloor ? (year - remainder) - 10 : (year - remainder) + 10,
        roundedDate = new Date(date.getTime()).setFullYear(roundedYear);
    return roundedDate;
  }

  return {
    findRange: pubFindRange,
    roundToDecade: pubRoundToDecade,
  }
})();

Hist.Timeline = (function() {
  var margin = {top: 90, right: 30, bottom: 90, left: 30},
      width = 960,
      height = 300,
      maxOfStacked = 4,
      pointSize = 25,
      yPosMargin = 30,
      pointClicked = false,
      pointPositions = {},
      timelinePoints,
      brush,
      xAxis,
      xScale,
      beginning,
      ending,
      chart,
      // Alias our TimelineUtils methods
      findRange = Hist.TimelineUtils.findRange,
      roundToDecade = Hist.TimelineUtils.roundToDecade;

  var initD3Chart = function() {
    var jsDates = timelinePoints.current.map(function(p) { return p.date.toDate(); }),
        gBrush,
        yearsToAddMultiPoint;

    beginning   = roundToDecade(d3.min(jsDates), true);
    ending      = roundToDecade(d3.max(jsDates));

    // Create out pointPositions object
    pointPositions = buildPointPositions();

    yearsToAddMultiPoint = removeTallPositions();
    addMultiPoints(yearsToAddMultiPoint);

    chart = d3.select('#timeline')
              .attr('width', width)
              .attr('height', height)
            .append("g")
              .attr("transform", "translate(" + margin.left + ",0)");

    xScale = d3.time.scale()
                    .nice(d3.time.year, 100)
                    .domain([beginning, ending])
                    .range([0, width - margin.right - margin.left]);
              
    xAxis = d3.svg.axis()
                  .scale(xScale)
                  .orient("bottom");

    chart.append("g")
      .attr("class", "x axis")
      .attr('transform', 'translate(0,' + (height - margin.bottom) + ')')
      .call(xAxis);

    chart.selectAll(".timeline-point")
      .data(timelinePoints.current)
    .enter().append("image")
      .attr("class", "timeline-point")
      .attr("id", function(p) { return 'point-' + p.id; })
      .attr("x", getXPosition)
      .attr("y", getYPosition)
      .attr("cx", getXPosition)
      .attr("cy", getYPosition)
      .attr("height", pointSize)
      .attr("width", pointSize)
      .attr("xlink:href", function(p) { return p.pointImage; })
      .on("mouseover", showActiveState)
      .on("mouseout", hideActiveState)
      .on("click", setClicked)

    initContextArea();
  }

  // D3 Plotting Helpers
  ///////////////////////

  var getXPosition = function(point) {
    var approxYear = pointPositions[point.id]['x'],
        approxDate = new Date(approxYear, 5);
    return xScale(approxDate) - (pointSize / 2);
  }

  var getYPosition = function(point) {
    // height - bottom => xAxis line
    // xAxis line - yPosMargin => Starting yPos for a 0 count point
    // starting yPos - (yPos[id] * pointSize) => final yPosition
    return height - margin.bottom - yPosMargin - (pointSize * pointPositions[point.id]['y']);
  }

  // Iterates through the timeline points to find their x and y positions
  // and stores them in pointPositions for later use. 
  // Returns { point.id => { x: xPos, y: yPos }, ... }
  var buildPointPositions = function() {
    var pointsDup = timelinePoints.current.clone(),
        count,
        xPos,
        range,
        pointYear
        result = {};

    timelinePoints.current.forEach(function(point, outerIndex) {
      count = 0;
      xPos = null;

      // Iterate through the dups to find the range that this point belongs in
      // and how many other points are in that same range. This determined xPos
      // which is the approximate year for the point and the count which is how
      // high we should stack the point.
      pointsDup.forEach(function(p, innerIndex) {
        range = findRange(p.date.year(), 10);
        pointYear = point.date.year();

        // Check if point's date is within the range created by p
        if (pointYear >= range[0] && pointYear <= range[1]) {
          xPos = range[0] + 2;
          if (point.id !== p.id) {
            count += 1;
          }
        }
      });

      // Remove the current point from pointsDup
      pointsDup = timelinePoints.hidePointWithId(point.id, pointsDup);

      // Set the x and y position of the current point
      result[point.id] = { 'x': xPos, 'y': count }
    });

    return result;
  }

  var removeTallPositions = function() {
    var yearsToAddMultiPoint = [],
        positionKeys = Object.keys(pointPositions),
        xPos,
        yPos;

    positionKeys.forEach(function(pId, idx) {
      xPos = pointPositions[pId]['x'];
      yPos = pointPositions[pId]['y'];

      if (yPos >= maxOfStacked) {
        yearsToAddMultiPoint.push(xPos);
        timelinePoints.current = timelinePoints.hidePointWithId(pId);
      }
    });

    return yearsToAddMultiPoint;
  }

  var addMultiPoints = function(yearsToAdd) {
    var mPoint;
    yearsToAdd = yearsToAdd.unique();
    yearsToAdd.forEach(function(year, idx) {
      mPoint = multiPoint(year);
      timelinePoints.current.push(mPoint);
      pointPositions[mPoint.id] = { x: year, y: maxOfStacked };
    });
  }

  // SVG Brush Helpers
  /////////////////////

  var initContextArea = function() {
    var contextWidth = 600,
        contextHeight = 50,
        contextTickSize = 50,
        contextXAxis,
        contextXScale,
        contextArea,
        context;

    contextXScale = d3.time.scale()
                           .range([0, contextWidth])
                           .domain(xScale.domain());
    contextXAxis = d3.svg.axis()
                         .scale(contextXScale)
                         .tickSize(contextTickSize)
                         // .tickPadding(-10)
                         .orient("bottom");

    contextArea = d3.svg.area()
                        .interpolate("monotone")
                        .x(function(d) { return contextXScale(d); })
                        .y0(contextHeight)
                        .y1(0);

    brush = d3.svg.brush()
                  .x(contextXScale)
                  .extent([beginning, ending])
                  .on("brushend", brushended);

    context = d3.select("#timeline").append("g")
                                    .attr("class", "context")
                                    .attr("transform", "translate(" + (width / 2 - contextWidth / 2) + "," + (height - margin.bottom + 25) + ")");

    context.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0,0)")
        .call(contextXAxis);

    gBrush = context.append("g")
                    .attr("class", "brush")
                    .call(brush)
                    .call(brush.event);
    
    gBrush.selectAll("rect")
          .attr('transform', 'translate(0,0)')
          .attr("height", contextTickSize);
  }

  var brushended = function() {
    console.log("brushend");
    var extent0 = brush.extent(),
        begin = extent0[0],
        end   = extent0[1];

    xScale.domain([begin, end]);
    chart.select(".x.axis").call(xAxis);
    timelinePoints.filterInRange("SHRED");
  }

  // Timeline Interaction Helpers
  ////////////////////////////////

  var initDomEventHandlers = function() {
    // Clicked away from a point handler, sets the state to inactive
    $("body").live("click", function(){
      var activePoint = $('#timeline').data('active-point'),
          activeEl;
      setUnclicked();
      if (activePoint) {
        activeEl = $('#point-' + activePoint.id)[0];
        hideActiveState.call(activeEl, activePoint);
      }
    });
  }

  var setClicked = function(point) {
    pointClicked = true;

    // Stop the event from bubbling up to body where we have a click handler to 
    // deactivate the current point. d3.event is the current event for this click
    d3.event.stopPropagation();
  }

  var setUnclicked = function() {
    pointClicked = false;
  }

  // Active State - Mousing over or clicked
  var showActiveImage = function(element, point) {
    var hoverImageUrl = point.pointImage.replace(/(.*)\.png/, "$1-hover.png");
    d3.select(element).attr("xlink:href", hoverImageUrl);
  }

  var showPopup = function(element, point) {
    var d3Element = d3.select(element),
        leftPos   = parseInt(d3Element.attr('x')),
        topPos    = parseInt(d3Element.attr('y')),
        leftOffset,
        topOffset,
        popupLeft;

    // Setup the content now so we can grab the height and use it to calculate the topOffset
    $('#popup h3').text(point.name);
    $('#popup p').text(point.description);
    $('#popup a').attr('href', "/pages/" + point.vanityUrl);
    popupHeight = $('#popup-container').height();

    leftOffset = (pointSize / 2);
    topOffset  = (pointSize / 2) + popupHeight + 11; // +11 px is for padding I think..

    // Now that we have the offset we can find the absolute position of the popup
    popupLeft = leftPos + pointSize + leftOffset + 'px';
    popupTop  = topPos + pointSize - topOffset + 'px';

    // Add the points type so we have colored borders and name text
    $('#popup').removeClass()
               .addClass(point.type);
    $('#popup-container').css({ left: popupLeft, top: popupTop })
                         .show();
  }

  var showActiveState = function(point) {
    // We just moused into a point, clear the last clicked point (if any)
    setUnclicked();
    if ($('#timeline').data('active-point')) {
      // Passing null here as hideActiveImage will find the element from the given point.id
      hideActiveImage(null, $('#timeline').data('active-point'));
    }

    // Set the hover point image and configure/show the popup
    showActiveImage(this, point);
    showPopup(this, point);

    // Store the currently active point so we can deactive it later
    $('#timeline').data('active-point', point);
  }

  // Deactive State
  //////////////////
  var hideActiveImage = function(element, point) {
    // If we weren't passed the element then find it by the given point.id, otherwise select it
    d3El = element === null ? d3.select('#point-' + point.id) : d3.select(element);
    d3El.attr("xlink:href", point.pointImage);
  }

  var hidePopup = function() {
    $('#popup-container').hide();
  }

  var hideActiveState = function(point) {
    // If we are currently focusing on a point (have clicked it) then we don't 
    // want to hide the active state.
    if (!pointClicked) {
      hideActiveImage(this, point);
      hidePopup();
    }
  }

  // Our Collection of Point Objects
  var pointCollection = function(pages) {
    var collection = {},
        allPoints = [],
        current = [],
        point;

    // Loop through the given pages and construct our timeline points
    pages.forEach(function(page, idx) {
      point = timelinePoint(page);
      if (point.isValid()) {
        allPoints.push(point);
        current.push(point);
      }
    });

    // TODO: Probably a smarter way of making this reusable for both 'this.current'
    // and the pointsDup in buildPointPosn. Can't think of it now. 
    var hidePointWithId = function(pId, points) {
      var pointId = parseInt(pId), 
          points = points || this.current;
      return points.filter(function(p) {
        return pointId !== p.id;
      });
    }

    var filterInRange = function(range) {
      console.log("filterInRange");
      this.current = [];
      this.allPoints.filter(function() {
        // TODO
      });
    }

    // Fields
    collection.allPoints = allPoints;
    collection.current = current;

    // Methods
    collection.filterInRange = filterInRange;
    collection.hidePointWithId = hidePointWithId;

    return collection;
  }

  // Our Point object
  var timelinePoint = function(page) {
    var point = {};

    // This is the kind of code you have to write when people use a table to 
    // represent a simple string. Seriously though, da fuq!
    var findType = function(categoryId) {
      switch (categoryId) {
        case 1:
          return 'person';
        case 2:
          return 'project';
        case 3:
          return 'organization';
        case 4:
          return 'event';
        default:
          return null;
      }
    }

    point.id = page['pk'];
    point.name = page['fields']['name'] || page['name'];
    point.vanityUrl = page['fields']['vanity_url'] || page['vanityUrl'];
    point.description = page['fields']['description'] || page['description'];
    point.date = moment(page['fields']['date_established']) || moment();
    point.type = findType(page['fields']['type']) || page['type'];
    point.pointImage = "/static/img/timeline/" + point.type + "-button.png";

    var toString = function() {
      // console.log("point.toString - point: ", point, " this: ", this);
      return "Point -> id: " + this.id + " name: " + this.name + " date: " + this.date.format('l') + " type: " + this.type;
    }

    var isValid = function() {
      return this.type != null && !!page['fields']['date_established'];
    }

    point.toString = toString;
    point.isValid  = isValid;

    return point;
  }

  var multiPoint = function(year) {
    var pointDefaults = { name: "Multiple Available", vanityUrl: null, description: "Multiple Available", type: 'multi', fields: {} },
        point = timelinePoint(pointDefaults);

    var generateRandomId = function() {
      return Math.floor((1 + Math.random()) * 0x10000)
                 .toString(16)
                 .substring(1);
    }

    point.id = generateRandomId();
    point.date = new Date(year, 5);

    return point;
  }

  // Public Interface
  ////////////////////

  return {

    init: function() {
      if (Hist.rawPages != null) {
        timelinePoints = pointCollection(Hist.rawPages);
        initD3Chart();
        initDomEventHandlers();
      }
    }
  }
})();