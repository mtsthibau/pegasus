/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


initParams = function (param, params2, params3) {

    params = param;
    parametros = params2;
    parametros2 = params3;
//    console.log("PARAMETROS 3" + params4);
//    console.log("PARAMETROS 3" + parametros3);

    google.charts.load('current', {'packages': ['corechart', 'bar']});

    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChartLine);
    google.charts.setOnLoadCallback(drawVisualization);

};

function drawChart() {

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Total');
    data.addColumn('number', 'Saldo');
    data.addRows([
        ['Ganhos Pegasus', params.total],
        ['Ganhos Entregadores', params.totalEntr]
    ]);
    var piechart_options = {title: 'Saldo e Totais (R$)',
        width: 400,
        height: 300,
        colors: ['#FF6F00', '#0087bb']
    };
    var piechart = new google.visualization.PieChart(document.getElementById('doubleChart'));
    piechart.draw(data, piechart_options);
    var barchart_options = {title: 'Saldo e Totais (R$)',
        width: 400,
        height: 300,
        legend: 'none',
        colors: ['#0087bb']
    };
    var barchart = new google.visualization.BarChart(document.getElementById('doubleChart2'));
    barchart.draw(data, barchart_options);
}
;


function drawChartLine() {

    var table = [];
//    [['Entrega', 'Valor']];
    var valor;
    for (var k = 0; k < parametros.length; k++) {
        valor = parseInt(parametros[k]);
        table[k] = ['Entrega N°: ' + k, parametros[k]];
    }

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Entrega');
    data.addColumn('number', 'Valor Entrega(R$)');
    data.addRows(table);

    var options = {
        title: 'Entregas Realizadas',
        width: 900,
        colors: ['#FF6F00'],
        Type: 'vertical',
        legend: {position: 'vertical'},
        chart: {subtitle: 'popularity by percentage'},
        axes: {
            x: {
                0: {side: 'top', label: 'White to move'} // Top x-axis.
            }
        },
        bar: {groupWidth: "90%"}
    };

    var barchart = new google.visualization.BarChart(document.getElementById('top_x_div'));
    barchart.draw(data, options);
}
;

function drawVisualization() {

    var table = [];
    var valor;
    for (var k = 0; k < parametros2.length; k++) {
        nome = parametros2[k];
        valor = parseInt(parametros2[k]);
        table[k] = [nome, valor];
    }

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Entregador');
    data.addColumn('number', 'Nota');
    data.addRows(table);

    var options = {
        colors: ['#0087bb'],
        title: 'Top 10 Entregadores',
        vAxis: {title: 'Notas'},
        hAxis: {title: 'Entregadores'},
        seriesType: 'bars',
        series: {5: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
};