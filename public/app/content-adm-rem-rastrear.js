/**
 * Created by matheus on 01/04/2016.
 */
define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';

        c.novoRastreamento = {data: {}};

        function initMap(){

        }
        //var map;
        //function initMap() {
        //    map = new google.maps.Map(document.getElementById('map'), {
        //        center: {lat: -34.397, lng: 150.644},
        //        zoom: 8
        //    });
        //};
        //apiService.get('entrega').then(function (msg) {
        //
        //    c.postagens = msg.data.rows;
        //});

    };

    return app.register.controller('contentAdmRemRastrearCtrl', ctrl);
});
