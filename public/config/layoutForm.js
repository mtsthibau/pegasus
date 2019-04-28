define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Leiaute';
        c.api = 'layout';
        c.redirect = 'config/' + c.api;

        $scope.$parent.c.init(c);
    };

    return app.register.controller('layoutFormCtrl', ctrl);
});