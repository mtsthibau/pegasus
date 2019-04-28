define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Produto';
        c.api = 'document/est/produto';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('estProdutoFormCtrl', ctrl);
});