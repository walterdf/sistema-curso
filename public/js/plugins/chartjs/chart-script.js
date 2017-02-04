/*
* Trending line chart
*/
//var randomScalingFactor = function(){ return Math.round(Math.random()*10)};
var trendingLineChart;
var data = {
	labels : ["Apple","Samsung","SONY","Motorola","Nokia","Microsoft","Xiaomi"],
	datasets : [
		{
			label: "First dataset",
			fillColor : "rgba(128, 222, 234, 0.6)",
			strokeColor : "#ffffff",
			pointColor : "#00bcd4",
			pointStrokeColor : "#ffffff",
			pointHighlightFill : "#ffffff",
			pointHighlightStroke : "#ffffff",
			data: [100, 50, 20, 40, 80, 50, 80]
		},
		{
			label: "Second dataset",
			fillColor : "rgba(128, 222, 234, 0.3)",
			strokeColor : "#80deea",
			pointColor : "#00bcd4",
			pointStrokeColor : "#80deea",
			pointHighlightFill : "#80deea",
			pointHighlightStroke : "#80deea",
			data: [60, 20, 90, 80, 50, 85, 40]
		}
	]
};

setInterval(function(){
  // Get a random index point
  var indexToUpdate = Math.round(Math.random() * (data.labels.length-1));
  if (typeof trendingLineChart != "undefined"){
	  // Update one of the points in the second dataset
	  if(trendingLineChart.datasets[0].points[indexToUpdate].value){
	  		trendingLineChart.datasets[0].points[indexToUpdate].value = Math.round(Math.random() * 100);
	  }
	  if(trendingLineChart.datasets[1].points[indexToUpdate].value){
	  		trendingLineChart.datasets[1].points[indexToUpdate].value = Math.round(Math.random() * 100);
	  }
	  trendingLineChart.update();
  }


}, 2000);


/*
Polor Chart Widget
*/

var doughnutData = [
	{
		value: 3000,
		color:"#F7464A",
		highlight: "#FF5A5E",
		label: "Mobile"
	},
	{
		value: 500,
		color: "#46BFBD",
		highlight: "#5AD3D1",
		label: "Kitchen"
	},
	{
		value: 1000,
		color: "#FDB45C",
		highlight: "#FFC870",
		label: "Home"
	}

];

/*
Trending Bar Chart
*/

var dataBarChart = {
    labels : ["JAN","FEB","MAR","APR","MAY","JUNE"],
    datasets: [
        {
            label: "Bar dataset",
            fillColor: "#46BFBD",
            strokeColor: "#46BFBD",
            highlightFill: "rgba(70, 191, 189, 0.4)",
            highlightStroke: "rgba(70, 191, 189, 0.9)",
            data: [6, 9, 8, 4, 6, 7]
        }
    ]
};

var nReloads1 = 0;
var min1 = 1;
var max1 = 10;
var l1 =0;
var trendingBarChart;
function updateBarChart() {
	if (typeof trendingBarChart != "undefined") {
	  	nReloads1++;
		var x = Math.floor(Math.random() * (max1 - min1 + 1)) + min1;
		trendingBarChart.addData([x], dataBarChart.labels[l1]);
		trendingBarChart.removeData();
		l1++;
		if( l1 == dataBarChart.labels.length){ l1 = 0;}
	}
}
setInterval(updateBarChart, 5000);

/*
Trending Bar Chart
*/
var radarChartData = {
	labels: ["Chrome", "Mozilla", "Safari", "IE10", "iPhone"],
	datasets: [
		{
			label: "First dataset",
			fillColor: "rgba(255,255,255,0.2)",
			strokeColor: "#fff",
			pointColor: "#00796b",
			pointStrokeColor: "#fff",
			pointHighlightFill: "#fff",
			pointHighlightStroke: "#fff",
			data: [5,6,7,8,6]
		}
	],
};


var nReloads2 = 0;
var min2 = 1;
var max2 = 10;
var l2 =0;
var trendingRadarChart;
function trendingRadarChartupdate() {
	if (typeof trendingRadarChart != "undefined") {
		nReloads2++;
		var x = Math.floor(Math.random() * (max2 - min2 + 1)) + min2;
		trendingRadarChart.addData([x], radarChartData.labels[l2]);
		var y = trendingRadarChart.removeData();
		l2++;
		if( l2 == radarChartData.labels.length){ l2 = 0;}
	}
}
setInterval(trendingRadarChartupdate, 5000);

/*
Pie chart
*/
var pieData = [
				{
					value: 300,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "America"
				},
				{
					value: 50,
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "Canada"
				},
				{
					value: 100,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "UK"
				},
				{
					value: 40,
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "Europe"
				},
				{
					value: 120,
					color: "#4D5360",
					highlight: "#616774",
					label: "Australia"
				}

			];
/*
Line Chart
*/
var lineChartData = {
	labels : ["USA","UK","UAE","AUS","IN","SA"],
	datasets : [
		{
			label: "My dataset",
			fillColor : "rgba(255,255,255,0)",
			strokeColor : "#fff",
			pointColor : "#00796b ",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data: [65, 45, 50, 30, 63, 45]
		}
	]

}

var polarData = [
		{
			value: 4800,
			color:"#f44336",
			highlight: "#FF5A5E",
			label: "USA"
		},
		{
			value: 6000,
			color: "#9c27b0",
			highlight: "#ce93d8",
			label: "UK"
		},
		{
			value: 1800,
			color: "#3f51b5",
			highlight: "#7986cb",
			label: "Canada"
		},
		{
			value: 4000,
			color: "#2196f3 ",
			highlight: "#90caf9",
			label: "Austrelia"
		},
		{
			value: 5500,
			color: "#ff9800",
			highlight: "#ffb74d",
			label: "India"
		},
		{
			value: 2100,
			color: "#009688",
			highlight: "#80cbc4",
			label: "Brazil"
		},
		{
			value: 5000,
			color: "#00acc1",
			highlight: "#4dd0e1",
			label: "China"
		},
		{
			value: 3500,
			color: "#4caf50",
			highlight: "#81c784",
			label: "Germany"
		}
	];
