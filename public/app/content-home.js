/**
 * Created by matheus.thibau on 11/11/2015.
 */

define(['app'], function (app) {
    'use strict';
    '$location';

    var ctrl = function (apiService, $location) {

        var c = this;
        c.title = 'Pegasus';
        c.tituloPagina = 'Home';
        c.novoDestaque = {data: {}};
        c.urlAtual = $location.url();

        apiService.get('destaque').then(function (msg) {

            c.destaques = msg.data.rows;
        });
    };

    return app.register.controller('contentHomeCtrl', ctrl);
});




