var w = 200;
var h = 200;
var padding = 2;
var dataset = [5, 10, 15, 20, 25];
var svg = d3.select("#container")
            .append("svg")
            .attr("width", w)
            .attr("height", h);

svg.selectAll("rect")
    .data(dataset)
    .enter()
    .append("rect")
    .attr({
        x: function(d, i){return i * (w/dataset.length)},
        y: function(d, i){return h - (d*6)},
        width: function(d, i){return (w/dataset.length) - padding},
        height: function(d, i){return d*6},
        fill: function(d, i){return "rgb(0, " + (d*10) + ", 0)"},
    });

svg.selectAll("text")
    .data(dataset)
    .enter()
    .append("text")
    .text(function(d){return d})
    .attr({
        "text-anchor": "middle",
        x: function(d, i){return i * (w/dataset.length) + (w/dataset.length)/2 },
        y: function(d, i){return h - (d*6) -padding}
    })