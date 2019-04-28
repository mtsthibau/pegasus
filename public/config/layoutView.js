define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Leiautes';
        c.module = 'config/';
        c.api = 'layout';

        $scope.$parent.c.init(c);
    };

    return app.register.controller('layoutViewCtrl', ctrl);
});