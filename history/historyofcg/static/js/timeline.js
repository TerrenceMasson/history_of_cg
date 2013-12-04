var Hist = Hist || {};

Hist.Timeline = (function() {
  var timelinePoints = [],
      margin = {top: 40, right: 40, bottom: 40, left: 40},
      width = 900,
      height = 300,
      yPositions = {},
      xScale, beginning, ending,  chart;

  var initD3Chart = function() {
    chart = d3.select('.timeline')
              .attr('width', width + margin.left + margin.right)
              .attr('height', height + margin.top + margin.bottom)
            .append("g")
              .attr("transform", "translate(30,0)");

    var jsDates = timelinePoints.map(function(p) { return p.date.toDate(); });
    beginning   = roundToDecade(d3.min(jsDates), true),
    ending      = roundToDecade(d3.max(jsDates));
    yPositions  = findYPositions();

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

    chart.selectAll(".timeline-item")
      .data(timelinePoints)
    .enter().append("circle")
      .attr("class", "timeline-item")
      .attr("x", getXPosition)
      .attr("y", getYPosition)
      .attr("cx", getXPosition)
      .attr("cy", getYPosition)
      .attr("r", 10)
      .attr("height", 10)
      .attr("width", 10)
      .style("fill", d3.scale.category20c())
      .text(function(p) { return p.date.year(); });
  }

  var getXPosition = function(point) {
    return xScale(point.date.toDate());
  }

  var getYPosition = function(point) {
    return margin.top + 50 * yPositions[point.id];
  }

  // Loop through the timelinePoints and count those which have the same year.
  // We use this later to determine if we should stack a point. 
  var findYPositions = function() {
    // I think I might just be braindead at this point. This can't be the
    // easiest way to do this..
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

  return {
    init: function() {
      Hist.rawPages.map(function(page) {
        if (page['fields']['date_established']) {
          var mDate = moment(page['fields']['date_established']);
          timelinePoints.push({ 'date':mDate, 'id':page['pk'], counted: false});
        }
      });

      timelinePoints.map(function(p, idx) {
        console.log("Point: ", p, " year: ", p.date.year());
      });
      initD3Chart();
    }
  }
})();