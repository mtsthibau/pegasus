/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery(function ($) {
    $("#rg").mask("aa-99.999.999");
});

var aceitar = function (id, usuario) {

    toastr["success"]("Deseja realmente aceitar esta entrega?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onclick='realEntrega(" + id + ", " + usuario + ")'> Sim</button>");
};

realEntrega =  function (id, usuario){
    //Pega localizacao e envia para o backend
    navigator.geolocation.getCurrentPosition(function (position) {
        var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
        };
        var url = "realEntrega?id=" + id + "&idFkEntr=" + usuario + "&latitude=" + pos.lat+ "&longitude=" + pos.lng;
       window.location =  url;
    });
};

initMap = function (latitude, longitude) {
    console.log(latitude);
    console.log(longitude);

    if (!latitude || !longitude) {
        return;
    }

    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: {lat: -19.93, lng: -43.93}
    });
    directionsDisplay.setMap(map);

    //getLocationNavigator
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            console.log(pos.lat);
            console.log(pos.lng);

            console.log(pos);

            var destinatario = new google.maps.LatLng(latitude, longitude);
            var remetente = new google.maps.LatLng(pos.lat, pos.lng);
            directionsService.route({
                origin: remetente,
                destination: destinatario,
                travelMode: google.maps.TravelMode.DRIVING
            }, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);

                } else {
                    toastr.error('Google não conseguiu calcular rota.Contacte o administrador:' + status);
                }
            });
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

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

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
}


$(document).ready(function () {

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
});
          