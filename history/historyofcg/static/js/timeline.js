/* 
* @Author: Gowiem
* @Date:   2013-12-17 14:21:17
*/

var Hist = Hist || {};

// Timeline Utils
//////////////////
Hist.TLUtils = (function() {
  var timeConversions = { "year": 31557600000,
                          "month": 2628000000,
                          "day":     86400000 };
  
  // Note: The following method uses memoization so it doesn't need to recalculate
  // the range for a year/mod pair that it has already seen. This is definitely
  // overkill, but I felt like doing this. :)
  var rangeMemo = {};
  var pubBuildRange = function(year, mod) {
    var result = rangeMemo[year],
        halfMod,
        remainder,
        rangeBegin,
        rangeEnd;
    // If we haven't seen the given year yet then continue and find the range.
    if (!result) {
      remainder = year % mod;
      halfMod = mod / 2;

      // Find the rangeBegin by using the remainder to determine if we need to start at xxx5 or xxx0
      rangeBegin = remainder <= halfMod ? year - remainder : year - remainder + halfMod;
      rangeEnd = rangeBegin + halfMod;

      result = Hist.TLO.range(moment(rangeBegin, 'YYYY').valueOf(), moment(rangeEnd, 'YYYY').valueOf());

      // Memoize the result so we don't have to do this again.
      rangeMemo[year + "|" + mod] = result;
    }

    return result;
  }

  // TODO: Memoize same as above
  var pubBuildMonthRange = function(date, numberOfMonths) {
    var monthDate = moment(date).startOf('month');

    rangeBegin = monthDate.clone().subtract('months', numberOfMonths);
    rangeEnd = monthDate.clone().add('months', numberOfMonths);
    result = Hist.TLO.range(rangeBegin.valueOf(), rangeEnd.valueOf());

    return result;
  }

  var pubConvertTime = function(howMany, type) {
    if (timeConversions.hasOwnProperty(type)) {
      return howMany * timeConversions[type];
    } else {
      console.assert(false, "Hist.TLUtils.convertTime was given unknown type: ", type);
    }
  }

  var pubRoundToDecade = function(date, shouldFloor) {
    var year = date.getFullYear(),
        remainder = year % 10,
        roundedYear = shouldFloor ? (year - remainder) - 10 : (year - remainder) + 10,
        roundedDate = new Date(date.getTime()).setFullYear(roundedYear);
    return roundedDate;
  }

  var pubGenerateRandomId = function() {
    return Math.floor((1 + Math.random()) * 0x10000)
               .toString(16)
               .substring(1);
  }

  return {
    buildRange: pubBuildRange,
    roundToDecade: pubRoundToDecade,
    convertTime: pubConvertTime,
    buildMonthRange: pubBuildMonthRange,
    generateRandomId: pubGenerateRandomId
  }
})();

// Timeline Objects
////////////////////
Hist.TLO = Hist.TLO || {};
Hist.TLO.range = function(begin, end) {
  var rangeObject = {},
      beginEpoch  = begin,
      endEpoch    = end,
      begin       = new Date(begin),
      end         = new Date(end),
      differenceInYears = end.getYear() - begin.getYear();

  var halfWayDate = function() {
    return new Date(beginEpoch + ((endEpoch - beginEpoch)/2));
  }

  var toString = function() {
    return "Range - begin: " + this.begin.toString() + " end: " + this.end.toString() + " halfWayDate: " + this.halfWayDate().toString();
  }

  // Fields
  rangeObject.begin = begin;
  rangeObject.end   = end;
  rangeObject.differenceInYears = differenceInYears;

  // Methods
  rangeObject.halfWayDate = halfWayDate;
  rangeObject.toString = toString;

  return rangeObject;
}

// Our Collection of Point Objects
Hist.TLO.pointCollection = function(pages) {
  var collection = {},
      allPoints = [],
      current = [],
      pointPositions = {},
      point,
      // Util Aliases
      buildRange      = Hist.TLUtils.buildRange,
      buildMonthRange = Hist.TLUtils.buildMonthRange,
      roundToDecade   = Hist.TLUtils.roundToDecade,
      // TLO Aliases
      timelinePoint   = Hist.TLO.timelinePoint,
      multiPoint      = Hist.TLO.multiPoint;


  // Loop through the given pages and construct our timeline points
  pages.forEach(function(page, idx) {
    point = timelinePoint(page);
    if (point.isValid()) {
      allPoints.push(point);
      current.push(point);
    }
  });

  // Iterates through the timeline points to find their x and y positions
  // and stores them in pointPositions for later use. 
  // Returns { point.id => { x: xPos, y: yPos }, ... }
  var buildPointPositions = function(timelineRange) {
    var pointsDup = this.current.clone(),
        self = this,
        count,
        xPos,
        pointYear,
        range,
        i;

    this.current.forEach(function(point, outerIndex) {
      count = 0;
      xPos = null;

      // Iterate through the dups to find the range that this point belongs in
      // and how many other points are in that same range. This determined xPos
      // which is the approximate year for the point and the count which is how
      // high we should stack the point.
      pointsDup.forEach(function(p, innerIndex) {
        pointYear = point.date.year();

        // Possible ranges:
        // 80+ years: buckets of 5 years
        // 30+ years: buckets of 4 years
        // 20+ years: Buckets of 2 years
        // 10+ years: Buckets of 1 year
        // 4+  years: Buckets of 4 months
        // 4-  years: No Range, Only stack if in same month
        if (timelineRange.differenceInYears >= 80) {
          range = buildRange(p.date.year(), 10);
          console.log("=========== range is 80+");
        } else if (timelineRange.differenceInYears >= 30) {
          console.log("=========== range is 30+");
          range = buildRange(p.date.year(), 8);
        } else if (timelineRange.differenceInYears >= 20) {
          console.log("=========== range is 20+");
          range = buildRange(p.date.year(), 4);
        } else if (timelineRange.differenceInYears >= 10) {
          console.log("=========== range is 10+");
          range = buildMonthRange(p.date, 6);
        } else if (timelineRange.differenceInYears >= 4) {
          console.log("=========== range is 4+");
          range = buildMonthRange(p.date, 2);
        } else {
          console.log("=========== range is 4-");
          range = null;
        }

        // Check if point's date is within the range created by p
        if (range && point.withinRange(range)) {
          xPos = range.halfWayDate();
          if (point.id !== p.id) {
            count += 1;
          }
        } else if (point.isSameMonthAsPoint(p) && point.id !== p.id) {
          xPos = p.date;
          count += 1;
        }



      }); // End pointsDup.forEach

      // Otherwise it stands alone and we should set the xPos to it's actual
      // position.
      if (!xPos) {
        xPos = point.date;
      }

      // Remove the current point from pointsDup
      pointsDup = hidePointWithId(point.id, pointsDup);

      // Set the x and y position of the current point
      self.pointPositions[point.id] = { 'x': xPos, 'y': count }
    });
  }

  var clearPointPositions = function() {
    this.pointPositions = {};
  }

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
    this.current = this.allPoints.filter(function(point, idx) {
      return point.withinRange(range);
    });
  }

  var addMultiPoints = function(yearsToAdd) {
    var self = this,
        mPoint;

    yearsToAdd = yearsToAdd.unique();
    yearsToAdd.forEach(function(year, idx) {
      mPoint = multiPoint(year);
      self.current.push(mPoint);
      self.pointPositions[mPoint.id] = { x: year, y: Hist.TL.config.maxOfStacked };
    });
  }

  var replaceMaxStacked = function() {
    var yearsToAddMultiPoint = [],
        positionKeys = Object.keys(this.pointPositions),
        self = this,
        xPos,
        yPos;

    positionKeys.forEach(function(pId, idx) {
      xPos = self.pointPositions[pId]['x'];
      yPos = self.pointPositions[pId]['y'];

      if (yPos >= Hist.TL.config.maxOfStacked) {
        yearsToAddMultiPoint.push(xPos);
        self.current = self.hidePointWithId(pId);
      }
    });

    // Now that we've remove the points which were stacked too high we can 
    // add back the multiPoints in their place.
    this.addMultiPoints(yearsToAddMultiPoint);
  }

  // Fields
  collection.allPoints = allPoints;
  collection.current = current;
  collection.pointPositions = pointPositions;

  // Methods
  collection.buildPointPositions = buildPointPositions;
  collection.clearPointPositions = clearPointPositions;
  collection.filterInRange = filterInRange;
  collection.hidePointWithId = hidePointWithId;
  collection.replaceMaxStacked = replaceMaxStacked;
  collection.addMultiPoints = addMultiPoints;

  return collection;
}

// Our Point object
Hist.TLO.timelinePoint = function(page) {
  var point = {};

  // This is the kind of code you have to write when people use a table to 
  // represent a simple string. Seriously though, da fuq!
  // TODO: I can do this simpler with an array.. doh. 
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
    return "Point -> id: " + this.id + " name: " + this.name + " date: " + this.date.format('l') + " type: " + this.type;
  }

  var isValid = function() {
    return this.type != null && !!page['fields']['date_established'];
  }

  var withinRange = function(range) {
    return this.date.isAfter(range.begin) && this.date.isBefore(range.end)
                                          || this.date.isSame(range.begin)
                                          || this.date.isSame(range.end);
  }

  var isSameMonthAsPoint = function(point) {
    return this.date.isSame(point.date, 'year') && this.date.isSame(point.date, 'month');
  }

  var isSameDayAsPoint = function(point) {
    return this.date.isSame(point.date, 'year') && this.date.isSame(point.date, 'month') && this.date.isSame(point.date, 'day');
  }

  point.toString = toString;
  point.isValid  = isValid;
  point.withinRange = withinRange;
  point.isSameMonthAsPoint = isSameMonthAsPoint;
  point.isSameDayAsPoint = isSameDayAsPoint;

  return point;
}

Hist.TLO.multiPoint = function(year) {
  var pointDefaults = { name: "Multiple Available", vanityUrl: null,
                        description: "Multiple Available", type: 'multi',
                        fields: {} },
      point = Hist.TLO.timelinePoint(pointDefaults);

  point.id = Hist.TLUtils.generateRandomId();
  point.date = moment(new Date(year, 5));

  return point;
}

// Timeline
////////////
Hist.TL = (function() {
  var margin = {top: 90, right: 30, bottom: 90, left: 30},
      width = 960,
      height = 300,
      maxOfStacked = 4,
      pointSize = 25,
      yPosMargin = 30,
      pointClicked = false,
      timelinePoints,
      brush,
      xAxis,
      xScale,
      beginning,
      ending,
      chart,
      // Alias our TimelineUtils methods
      buildRange      = Hist.TLUtils.buildRange,
      buildMonthRange = Hist.TLUtils.buildMonthRange,
      roundToDecade   = Hist.TLUtils.roundToDecade,
      // Alias our Timeline Objects
      pointCollection = Hist.TLO.pointCollection,
      timelinePoint   = Hist.TLO.timelinePoint,
      multiPoint      = Hist.TLO.multiPoint;



  var initD3Chart = function() {
    var jsDates = timelinePoints.current.map(function(p) { return p.date.toDate(); });

    beginning   = roundToDecade(d3.min(jsDates), true);
    ending      = roundToDecade(d3.max(jsDates));

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

    timelinePoints.buildPointPositions(Hist.TLO.range(beginning, ending));

    // Replace the points which are stacked too high with multiPoints
    timelinePoints.replaceMaxStacked();

    var points = chart.selectAll(".timeline-point").data(timelinePoints.current);
    points.enter()
      .append("image")
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
      .on("click", setClicked);

    initContextArea();
  }

  var draw = function(range) {
    var points;

    // Create out pointPositions object
    console.log("timelinePoints.pointPositions: ", timelinePoints.pointPositions);
    timelinePoints.clearPointPositions();
    console.log("timelinePoints.pointPositions: ", timelinePoints.pointPositions);
    timelinePoints.buildPointPositions(range);
    console.log("timelinePoints.pointPositions: ", timelinePoints.pointPositions);
    // Replace the points which are stacked too high with multiPoints
    timelinePoints.replaceMaxStacked();

    // Remove the current points
    chart.selectAll(".timeline-point").remove();

    // Set the newly filtered points as our new data
    points = chart.selectAll(".timeline-point").data(timelinePoints.current);
    points.enter()
          .append("image")
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
          .on("click", setClicked);
  }

  // D3 Plotting Helpers
  ///////////////////////
  var getXPosition = function(point) {
    var date = timelinePoints.pointPositions[point.id]['x'];
    return xScale(date) - (pointSize / 2);
  }

  var getYPosition = function(point) {
    // height - bottom => xAxis line
    // xAxis line - yPosMargin => Starting yPos for a 0 count point
    // starting yPos - (yPos[id] * pointSize) => final yPosition
    return height - margin.bottom - yPosMargin - (pointSize * timelinePoints.pointPositions[point.id]['y']);
  }

  // SVG Brush Helpers
  /////////////////////

  var initContextArea = function() {
    var contextWidth = 600,
        contextHeight = 30,
        contextTickSize = 30,
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
                         .tickPadding(5)
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
    var extent0 = brush.extent(),
        begin = extent0[0],
        end   = extent0[1],
        range = Hist.TLO.range(begin, end);

    xScale.domain([begin, end]);
    xAxis.scale(xScale);
    chart.select(".x.axis").call(xAxis);
    timelinePoints.filterInRange(range);
    draw(range);
  }

  // Timeline Interaction Helpers
  ////////////////////////////////
  // TODO: Pull out to own module and merge with Hist.TL on init
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

  var addDescriptionToPoint = function(description) {
    if (description.length <= 200) {
      $('.regular-point .description').text(description);
    } else {
      $('.regular-point .description').text(description.substring(0, 200) + "...");
    }
  }

  var showPopup = function(element, point) {
    var d3Element = d3.select(element),
        leftPos   = parseInt(d3Element.attr('x')),
        topPos    = parseInt(d3Element.attr('y')),
        leftOffset,
        topOffset,
        popupLeft;

    // Hide both popups so we aren't showing both.
    $('.popup').hide();

    if (point.type !== 'multi') {
      // Setup the content now so we can grab the height and use it to calculate the topOffset
      $('.regular-point h3').text(point.name);
      addDescriptionToPoint(point.description);
      $('.regular-point .date').text(point.date.format("dddd, MMMM Do YYYY"));
      $('.regular-point a').attr('href', "/pages/" + point.vanityUrl);
      $('.regular-point').removeClass()
                         .addClass(point.type)
                         .addClass("popup")
                         .addClass("regular-point")
                         .show();
    } else {
      $('.multi-point').show();
    }

    popupHeight = $('#popup-container').height();
    leftOffset = (pointSize / 2);
    topOffset  = (pointSize / 2) + popupHeight + 11; // +11 px is for padding I think..

    // Now that we have the offset we can find the absolute position of the popup
    popupLeft = leftPos + pointSize + leftOffset + 'px';
    popupTop  = topPos + pointSize - topOffset + 'px';

    $('#popup-container').css({ left: popupLeft, top: popupTop }).show()
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

  // Public Interface
  ////////////////////
  return {

    init: function() {
      if (Hist.rawPages != null) {
        timelinePoints = pointCollection(Hist.rawPages);
        initD3Chart();
        initDomEventHandlers();
      }
    },
    config: {
      maxOfStacked: maxOfStacked
    }
  }
})();