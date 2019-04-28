define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Modelos';
        c.module = 'config/';
        c.api = 'model';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('modelViewCtrl', ctrl);
});