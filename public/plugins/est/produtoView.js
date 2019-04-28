define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Produtos';
        c.api = 'document/est/produto';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('estProdutoViewCtrl', ctrl);
});