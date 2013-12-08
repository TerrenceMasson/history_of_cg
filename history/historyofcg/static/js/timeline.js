var Hist = Hist || {};

Hist.Timeline = (function() {
  var timelinePoints = [],
      margin = {top: 90, right: 40, bottom: 40, left: 40},
      width = 900,
      height = 300,
      yPositions = {},
      pointImageSize = 25,
      pointMargin = 23,
      xScale,
      beginning,
      ending,
      highestYPosition,
      chart;

  var initD3Chart = function() {
    var jsDates = timelinePoints.map(function(p) { return p.date.toDate(); });
    beginning   = roundToDecade(d3.min(jsDates), true);
    ending      = roundToDecade(d3.max(jsDates));
    yPositions  = buildYPositions();
    highestYPosition = d3.max(d3.values(yPositions));

    chart = d3.select('#timeline')
              .attr('width', width + margin.left + margin.right)
              .attr('height', height + margin.top + margin.bottom)
            .append("g")
              .attr("transform", "translate(30,0)");

    xScale = d3.time.scale()
                    .nice(d3.time.year, 100)
                    .domain([beginning, ending])
                    .range([0, width - margin.right - margin.left]);
              
    var xAxis = d3.svg.axis()
                      .scale(xScale)
                      .orient("bottom");

    chart.append("g")
      .attr("class", "x axis")
      .attr('transform', 'translate(0, ' + (height - margin.top - margin.bottom) + ')')
      .call(xAxis);

    chart.selectAll(".timeline-point")
      .data(timelinePoints)
    .enter().append("image")
      .attr("class", "timeline-point")
      .attr("x", getXPosition)
      .attr("y", getYPosition)
      .attr("cx", getXPosition)
      .attr("cy", getYPosition)
      .attr("height", pointImageSize)
      .attr("width", pointImageSize)
      .attr("xlink:href", function(p) { return p.pointImage })
      .style("fill", d3.scale.category20c())
      .on("mouseover", showActiveState)
      .on("mouseout", hideActiveState)
      .text(function(p) { return p.date.year(); });
  }

  var getXPosition = function(point) {
    return xScale(point.date.toDate()) - (pointImageSize / 2);
  }

  var getYPosition = function(point) {
    return margin.top + pointMargin * yPositions[point.id];
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

    leftOffset = (pointImageSize / 2);
    topOffset  = (pointImageSize / 2) + popupHeight + 11; // 11 px is for padding I think..

    // Now that we have the offset we can find the absolute position of the popup
    popupLeft = leftPos + pointImageSize + leftOffset + 'px';
    popupTop  = topPos + pointImageSize - topOffset + 'px';

    $('#popup-container').css({ left: popupLeft, top: popupTop })
                         .show();
  }

  var showActiveState = function(point) {
    showActiveImage(this, point);
    showPopup(this, point);
  }

  // Inactive State
  var hideActiveImage = function(element, point) {
    d3.select(element).attr("xlink:href", point.pointImage);
  }

  var hidePopup = function() {
    $('#popup-container').hide();
  }

  var hideActiveState = function(point) {
    hideActiveImage(this, point);
    hidePopup();
  }

  // Loop through the timelinePoints and count those which have the same year.
  // We use this later to determine if we should stack a point.
  var buildYPositions = function() {
    timelinePoints.forEach(function(point, idx) {
      var count = 0;
      timelinePoints.forEach(function(p, idx) {
        if (point.date.year() === p.date.year() && point.id !== p.id && !p.counted) {
          count += 1;
        }
      });
      yPositions[point.id] = count;
      point.counted = true;
    });
    return yPositions;
  }

  var roundToDecade = function(date, shouldFloor) {
    var year = date.getFullYear(),
        remainder = year % 10,
        roundedYear = shouldFloor ? (year - remainder) - 10 : (year - remainder) + 10,
        roundedDate = new Date(date.getTime()).setFullYear(roundedYear);
    return roundedDate;
  }

  // This is the kind of code you have to write when people use a table to 
  // represent a simple string type. Seriously though, da fuq!
  var buildImageUrl = function(type) {
    switch (type) {
      case 1:
        // Person
        return "/static/img/timeline/person-button.png"
      case 2:
        // Project
        return "/static/img/timeline/project-button.png"
      case 3:
        // Organizaiton
        return "/static/img/timeline/organization-button.png"
      case 4:
        // Event
        return "/static/img/timeline/event-button.png"
      default:
        return null;
    }
  }

  var buildTimelinePoints = function(pages) {
    var result = [];
    pages.forEach(function(page) {
      var mDate = moment(page['fields']['date_established']),
          pointImage = buildImageUrl(page['fields']['type']);
      if (pointImage && page['fields']['date_established']) {
        result.push({
          'id': page['pk'],
          'name': page['fields']['name'],
          'vanityUrl': page['fields']['vanity_url'],
          'description': page['fields']['description'],
          'date': mDate,
          'pointImage': pointImage,
          'counted': false
        });
      }
    });
    return result;
  }

  return {
    init: function() {
      timelinePoints = buildTimelinePoints(Hist.rawPages);
      initD3Chart();
    }
  }
})();