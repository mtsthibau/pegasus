define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Clientes';
        c.api = 'document/crm/cliente';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('crmClienteViewCtrl', ctrl);
});