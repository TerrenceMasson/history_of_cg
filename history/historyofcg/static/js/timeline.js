var Hist = Hist || {};

Hist.Timeline = (function() {
  var momentDates = [],
      xAxisValues = [],
      margin = {top: 40, right: 40, bottom: 40, left:40},
      width = 900,
      height = 300,
      chart;

  var initD3Chart = function() {
    chart = d3.select('.timeline')
              .attr('width', width + margin.left + margin.right)
              .attr('height', height + margin.top + margin.bottom)
            .append("g")
              .attr("transform", "translate(30,0)");

    var jsDates   = momentDates.map(function(m) { return m.toDate(); }),
        beginning = roundToDecade(d3.min(jsDates), true),
        ending    = roundToDecade(d3.max(jsDates));

    var scaleFactor = (1/ (ending - beginning)) * ( width - margin.left - margin.right );
    console.log("ending: ", ending, " beginning: ", beginning, " Scale Factor: ", scaleFactor);

    var xScale = d3.time.scale()
              .nice(d3.time.year, 100)
              .domain([beginning, ending])
              .range([0, width - margin.right - margin.left])
              
    var xAxis = d3.svg.axis()
                      .scale(xScale)
                      .orient("bottom");

    chart.append("g")
      .attr("class", "x axis")
      .attr('transform', 'translate(0, ' + (height - margin.top - margin.bottom) + ')')
      .call(xAxis);

    chart.selectAll(".event")
      .data(jsDates)
    .enter().append("circle")
      .attr("class", "shred")
      .attr("x", xScale)
      .attr("y", 10)
      .attr("cx", xScale)
      .attr("cy", 10)
      .attr("r", 10)
      .attr("height", 10)
      .attr("width", 10)
      .style("fill", d3.scale.category20(10))
      .text(function(m) {return m.getYear(); });
  }

  var roundToDecade = function(date, shouldFloor) {
    var year = date.getFullYear(),
        remainder = year % 10,
        roundedYear = shouldFloor ? (year - remainder) - 10 : (year - remainder) + 10;
    date.setFullYear(roundedYear);
    return date;
  }

  return {
    init: function() {
      Hist.rawPages.map(function(page) {
        if (page['fields']['date_established']) {
          var mDate = moment(page['fields']['date_established']);
          momentDates.push(mDate);
        }
      });
      momentDates.sort();
      initD3Chart();
    }
  }
})();