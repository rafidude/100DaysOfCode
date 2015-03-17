var w = 210;
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

var svg = d3.select("#container")
            .append("svg")
            .attr("width", w)
            .attr("height", h);

// KPI color
function salesKPI(d){
    if (d >= 60) {return "#33CC66";} else
    return "#666666";
}
var dots = svg.selectAll("circle")
    .data(monthlySales)
    .enter()
    .append("circle")
    .attr({
        cx: function(d){ return d.month*2},
        cy: function(d){ return h - d.sales*2},
        r: 5,
        fill: function(d){ return salesKPI(d.sales);}
    });
