/**
 * Created by matheus on 30/03/2016.
 */
define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';

        apiService.get('banner').then(function (msg) {

            c.historicos = msg.data.rows;

        });
    };

    return app.register.controller('contentAdmnEntHistoricoCtrl', ctrl);
});
