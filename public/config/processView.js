define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Processos';
        c.module = 'config/';
        c.api = 'process';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('processViewCtrl', ctrl);
});