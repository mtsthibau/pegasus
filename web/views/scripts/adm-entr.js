// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.

var total = 0;
var saldo = 0;
sincronizar = function (id) {
//Pega localizacao e envia para o backend
    navigator.geolocation.getCurrentPosition(function (position) {
        var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
        };
        console.log(pos);
        var url = "getLocalEntr?id=" + id + "&latitude=" + pos.lat + "&longitude=" + pos.lng;
        console.log(url);
        window.location = url;
    });
};
function initMap() {

    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 14
    });
    var infoWindow = new google.maps.InfoWindow({map: map});
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {

            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            infoWindow.setPosition(pos);
            infoWindow.setContent('Você está aqui!');
            map.setCenter(pos);
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
}

initParams = function (params, params2, params3) {

    total = params.total;
    saldo = params.saldo;
    parametros = params2;
    parametros2 = params3;

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
        ['Total Recebido', total],
        ['Saldo Atual', saldo]
    ]);
    var piechart_options = {title: 'Saldo e Totais (R$)',
        width: 400,
        height: 300,
        colors: ['#FF6F00', '#0087bb']
    };
    var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
    piechart.draw(data, piechart_options);
    var barchart_options = {title: 'Saldo e Totais (R$)',
        width: 400,
        height: 300,
        legend: 'none',
        colors: ['#0087bb']
    };
    var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
    barchart.draw(data, barchart_options);
}
;
function drawChartLine() {

    var table = [];
//    [['Entrega', 'Valor']];
    var valor;
    for (var k = 0; k < parametros.length; k++) {
        valor = parseInt(parametros[k]);
        table[k] = ['Entrega N°:' + k, parametros[k]];
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
};


function drawVisualization() {

    var table = [];
    var valor;
    console.log(parametros2);
    for (var k = 0; k < parametros2.length; k++) {
        nome = parametros2[k];
        valor = parseInt(parametros2[k]);
        table[k] = [nome, valor - valor / 100 * 10];
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
}




