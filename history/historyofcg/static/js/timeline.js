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
  var timelinePoints = [],
      margin = {top: 90, right: 30, bottom: 40, left: 30},
      width = 960,
      height = 200,
      pointPositions = {},
      pointSize = 25,
      yPosMargin = 30,
      pointClicked = false,
      xScale,
      beginning,
      ending,
      chart,
      // Alias our TimelineUtils methods
      findRange = Hist.TimelineUtils.findRange,
      roundToDecade = Hist.TimelineUtils.roundToDecade;

  var initD3Chart = function() {
    var jsDates = timelinePoints.map(function(p) { return p.date.toDate(); });

    beginning   = roundToDecade(d3.min(jsDates), true);
    ending      = roundToDecade(d3.max(jsDates));

    // Create out pointPositions object
    findPointPositions();

    chart = d3.select('#timeline')
              .attr('width', width)
              .attr('height', height)
            .append("g")
              .attr("transform", "translate(" + margin.left + ",0)");

    xScale = d3.time.scale()
                    .nice(d3.time.year, 100)
                    .domain([beginning, ending])
                    .range([0, width - margin.right - margin.left]);
              
    var xAxis = d3.svg.axis()
                      .scale(xScale)
                      .orient("bottom");

    chart.append("g")
      .attr("class", "x axis")
      .attr('transform', 'translate(0,' + (height - margin.bottom) + ')')
      .call(xAxis);

    chart.selectAll(".timeline-point")
      .data(timelinePoints)
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
  var findPointPositions = function() {
    var pointsDup = timelinePoints.clone(),
        count,
        xPos,
        range,
        pointYear;

    timelinePoints.forEach(function(point, outerIndex) {
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
      pointsDup = pointsDup.filter(function(p) {
        return point.id !== p.id;
      });

      // Set the x and y position of the current point
      pointPositions[point.id] = { 'x': xPos, 'y': count }
    });
  }

  // Timeline Interaction Helpers
  ////////////////////////////////

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

  // Data Initialization Helpers
  ///////////////////////////////

  // TODO: Create TimelinePoint object/constructor to clean this shit up.

  // This is the kind of code you have to write when people use a table to 
  // represent a simple string type. Seriously though, da fuq!
  var findTypeFromStupidFuckingCategoryId = function(stupidFuckingCategoryId) {
    switch (stupidFuckingCategoryId) {
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

  var buildTimelinePoints = function(pages) {
    var result = [];
    pages.forEach(function(page) {
      var mDate = moment(page['fields']['date_established']),
          type  = findTypeFromStupidFuckingCategoryId(page['fields']['type']);
      if (type && page['fields']['date_established']) {
        result.push({
          'id': page['pk'],
          'name': page['fields']['name'],
          'vanityUrl': page['fields']['vanity_url'],
          'description': page['fields']['description'],
          'date': mDate,
          'type': type,
          'pointImage': "/static/img/timeline/" + type + "-button.png",
          'counted': false
        });
      }
    });
    return result;
  }


  // Public Interface
  ////////////////////

  return {

    init: function() {
      if (Hist.rawPages != null) {
        timelinePoints = buildTimelinePoints(Hist.rawPages);
        initD3Chart();
      }

      // Clicked away from a point handler, sets the state to inactive
      $("body").live("click", function(){
        var activePoint = $('#timeline').data('active-point'),
            activeEl;
        if (activePoint && pointClicked) {
          setUnclicked();
          activeEl = $('#point-' + activePoint.id)[0];
          hideActiveState.call(activeEl, activePoint);
        }
      });
    }
  }
})();