google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = google.visualization.arrayToDataTable([
		['Effort', 'Amount given'],
		['Avance',     80],
		['Faltantes',     20],
	]);

	var options = {
		pieHole: 0.5,
		pieSliceTextStyle: {
			color: 'white',
		},
		legend: 'none'
	};

	var chartDetalle = new google.visualization.PieChart(document.getElementById('graficoDetalleProyecto'));
	chartDetalle.draw(data, options);
}