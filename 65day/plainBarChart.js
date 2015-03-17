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
    .attr("x", function(d, i){
        return (i * (w/dataset.length));
    })
    .attr("y", function(d){
        return h - (d*6);
    })
    .attr("width", (w/dataset.length) - padding)
    .attr("height", function(d){
        return d*6;
    })
    .attr("fill", function(d){
        return "rgb(0, " + (d*10) + ", 0)";
    });