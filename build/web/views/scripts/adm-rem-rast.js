function initMap(latitude, longitude) {
    console.log(latitude, longitude);

    if (latitude == null || longitude == null) {
        toastr.warning("<h4><b>Selecione</b> uma das entregas para exibir localização em tempo real!</h4>");

    } else {

        var uluru = {lat: latitude, lng: longitude};
        console.log(uluru);
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 14,
            center: uluru
        });

        var contentString = 'Posição Atual do Entregador';

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

}

