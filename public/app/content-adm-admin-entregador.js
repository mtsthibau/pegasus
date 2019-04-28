define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';
        c.novoEntregador = {data: {}};
    };

    return app.register.controller('contentAdmAdminEntregadorCtrl', ctrl);
});
