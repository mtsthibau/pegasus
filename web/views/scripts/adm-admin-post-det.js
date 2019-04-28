/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function initMap(latitude, longitude) {
    var la = parseFloat(latitude);
    var lo = parseFloat(longitude);
    
    var uluru = {lat: la, lng: lo};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: uluru
    });

    var contentString = '<b>Entregador</b>';

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


