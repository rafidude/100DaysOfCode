var w = 210;
var h = 200;

var svg = d3.select("#container")
            .append("svg")
            .attr("width", w)
            .attr("height", h);

d3.json("sales.json", function(error, data){
    if (error){
        console.log(error);
    }
    chart(data);
});

// KPI color
function salesKPI(d){
    if (d >= 60) {return "#33CC66";} else
    return "#666666";
}

// Generate Chart
function chart(data){
    var dots = svg.selectAll("circle")
        .data(data)
        .enter()
        .append("circle")
        .attr({
            cx: function(d){ return d.month*2},
            cy: function(d){ return h - d.sales*2},
            r: 5,
            fill: function(d){ return salesKPI(d.sales);}
        });
}
