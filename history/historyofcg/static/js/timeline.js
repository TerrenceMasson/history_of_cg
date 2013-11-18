var Hist = Hist || {};

Hist.Timeline = (function() {
  var momentDates = [],
      xAxisValues = [],
      width = 900,
      height = 300,
      chart;

  var roundYear = function(year, mod) {
    var remainder = year % mod;
    return year - remainder;
  }

  // If only JavaScript had ranges..
  var constructXValues = function(dates) {
    var years = momentDates.map(function(m) { return m.year(); }),
        min = roundYear(d3.min(years), 10),
        max = roundYear(d3.max(years), 10),
        steps = (max - min) / 10,
        result = [min];
    for (var i = 0; i < steps - 1; i++) {
      result.push(result[i] + 10);
    };
    result.push(max);
    return result;
  }

  var initD3Chart = function() {
    chart = d3.select('.timeline')
              .attr('width', width)
              .attr('height', height)
            .append("g")
              .attr("transform", "translate(30,0)");;
    
    // X Ordinal Scale
    xAxisValues = constructXValues(momentDates);
    var x = d3.scale.ordinal()
              .rangeRoundBands([0, width], .1)
              .domain(xAxisValues);
    // X axis
    var xAxis = d3.svg.axis()
                      .scale(x)
                      .orient("bottom");

    chart.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + (height - 20) + ")")
      .call(xAxis);
  }

  return {
    init: function() {
      console.log("Raw Pages: ", Hist.rawPages);
      Hist.rawPages.map(function(page) {
        if (page['fields']['date_established']) {
          var mDate = moment(page['fields']['date_established']);
          momentDates.push(mDate);
        }
      });
      momentDates.sort();
      console.log("momentDates: ", momentDates);
      initD3Chart();
    }
  }
})();