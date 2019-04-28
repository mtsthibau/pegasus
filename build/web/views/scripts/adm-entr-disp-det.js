
initMap = function (latitudeRem, longitudeRem, latitudeDest, longitudeDest) {
    console.log(latitudeRem);
    console.log(longitudeRem);
    console.log(latitudeDest);
    console.log(longitudeDest);

    if (!latitudeRem || !longitudeRem || !latitudeDest || !longitudeDest) {
        return;
    }


    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: {lat: -19.93, lng: -43.93}
    });
    directionsDisplay.setMap(map);

    var destinatario = new google.maps.LatLng(latitudeDest, longitudeDest);
    var remetente = new google.maps.LatLng(latitudeRem, longitudeRem);
    directionsService.route({
        origin: remetente,
        destination: destinatario,
        travelMode: google.maps.TravelMode.DRIVING
    }, function (response, status) {
        if (status === google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        } else {
            toastr.danger('Google não conseguiu calcular rota. Contacte o administrador:' + status);
        }
    });

};
var contentString = '<img src ="../../IMG/shin_chan.jpg"/><br><b>Entregador</b> - Matheus Thibau Paulino';

var infowindow = new google.maps.InfoWindow({
    content: contentString
});

var marker = new google.maps.Marker({
    position: uluru,
    map: map,
    title: 'Entregador'
});

marker.addListener('click', function () {
    infowindow.open(map, marker);
});

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
});