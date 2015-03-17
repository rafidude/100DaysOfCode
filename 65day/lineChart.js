var w = 200;
var h = 200;

monthlySales = [
    {"month":10, "sales": 20},
    {"month":20, "sales": 5},
    {"month":30, "sales": 30},
    {"month":40, "sales": 80},
    {"month":50, "sales": 60},
    {"month":60, "sales": 20},
    {"month":70, "sales": 10},
    {"month":80, "sales": 0},
    {"month":90, "sales": 8},
    {"month":100, "sales": 10},
];

var lineFun = d3.svg.line()
    .x(function(d){ return d.month*2})
    .y(function(d){ return h - d.sales*2})
    .interpolate("linear");
//    .interpolate("basis");

var svg = d3.select("#container")
            .append("svg")
            .attr("width", w)
            .attr("height", h);

var viz = svg.append("path")
    .attr({
        d: lineFun(monthlySales),
        "stroke": "purple",
        "stroke-width": 2,
        "fill": "none"
    })
