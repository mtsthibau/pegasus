define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Cliente';
        c.api = 'document/crm/cliente';

        c.addContato = function () {
            if (!c.inst.data.contatos)
                c.inst.data.contatos = [];
            c.inst.data.contatos.push({});
        };

        c.delContato = function (item) {
            var index = c.inst.data.contatos.indexOf(item);
            c.inst.data.contatos.splice(index, 1);
        };

        $scope.$parent.c.init(c);
    };

    return app.register.controller('crmClienteFormCtrl', ctrl);
});