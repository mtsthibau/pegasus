/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//realEntrega = function (postId) {
//    //Pega localizacao e envia para o backend
//    navigator.geolocation.getCurrentPosition(function (position) {
//        var pos = {
//            lat: position.coords.latitude,
//            lng: position.coords.longitude
//        };
//        var url = "iniciarColeta?id=" + postId + "&latitudeAtual=" + pos.lat + "&longitudeAtual=" + pos.lng;
//        window.location = url;
//    });
//};

var contentString;

function initParams(nome, email, telefone, celular) {
    nome1 = nome;
    email1 = email;
    telefone1 = telefone;
    celular1 = celular;
    contentString = '<b>Entregador - </b><br>' + nome1;
}

function initMap(latitude, longitude) {

    var uluru = {lat: latitude, lng: longitude};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: uluru
    });

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
}

    