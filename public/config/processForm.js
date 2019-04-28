//define(['app'], function (app) {
//    'use strict';
//
//    var ctrl = function ($scope) {
//
//        var c = this;
//
//        c.caption = 'Processo';
//        c.api = 'process';
//        c.redirect = 'config/' + c.api;
//
//        c.addItem = function () {
//            var d = c.inst.data;
//            if (!d.items) {
//                d.items = [];
//            }
//            d.items.push({});
//        };
//
//        $scope.$parent.c.init(c);
//    };
//
//    return app.register.controller('processFormCtrl', ctrl);
//});