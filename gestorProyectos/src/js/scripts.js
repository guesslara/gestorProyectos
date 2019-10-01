google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// $(function () {
//     var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
//     $('#layout').w2layout({
//         name: 'layout',
//         padding: 3,
//         panels: [
//             { type: 'left', size: 200, resizable: true, style: pstyle, content: 'left' },
//             { type: 'main', style: pstyle, content: 'main' }
//         ]
//     });
// });
function mostrarMenu(){
	$("#menuProyectos").toggleClass("mostrarMenu");
}
function mostrarSubmenu(){
	$("#submenuVentana").toggleClass("mostrarSubmenu");	
}
function drawChart() {
	var data = google.visualization.arrayToDataTable([
		['Effort', 'Amount given'],
		['Avance',     80],
		['Faltantes',     20],
	]);

	var options = {
		pieHole: 0.6,
		pieSliceTextStyle: {
			color: 'white',
		},
		legend: 'none',
		pieSliceText: 'none'
	};

	var chart1 = new google.visualization.PieChart(document.getElementById('graficoAvance1'));
	chart1.draw(data, options);
	var chart2 = new google.visualization.PieChart(document.getElementById('graficoAvance2'));
	chart2.draw(data, options);
	var chart3 = new google.visualization.PieChart(document.getElementById('graficoAvance3'));
	chart3.draw(data, options);
}