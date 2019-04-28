/**
 * Created by matheus on 30/03/2016.
 */
define(['app'], function (app) {
    'use strict';
    '$location';

    var ctrl = function ($location) {

        var c = this;
        c.title = 'Pegasus';
        c.tituloPagina = 'Interno Administrador';
        c.urlAtual = $location.url();
    };

    return app.register.controller('contentAdmAdminCtrl', ctrl);
});