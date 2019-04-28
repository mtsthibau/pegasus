define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Modelo';
        c.api = 'model';
        c.redirect = 'config/' + c.api;

        $scope.$parent.c.init(c);
    };

    return app.register.controller('modelFormCtrl', ctrl);
});