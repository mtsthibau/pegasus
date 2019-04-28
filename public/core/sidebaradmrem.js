define(['app'], function (app) {
    "use strict";

    app.directive('sidebaradmrem', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<div class="col-md-3 col-lg-3">' +
            '<ul class="nav">' +
            '<li ng-repeat="item in items" class="active">' +
            '<a ng-href="{{item.url}}" class="menu-texto"><i class="{{item.icone}}"></i>{{item.nome}}</a>' +
            '</li>' +

            '</ul>' +
            '</div>'
        };
    });

    app.controller('sidebarAdmRemCtrl', function ($scope) {
        $scope.items = [
            {
                nome: ' Início',
                icone: 'fa fa-home menu-icon',
                url:'#/adm-rem'
            },
            {
                nome: ' Postagens',
                icone: 'fa fa-truck fa-wrench menu-icon',
                url:'#/adm-rem-post'
            },
            {
                nome: ' Histórico',
                icone: 'fa fa-fw fa-history menu-icon',
                url:'#/adm-rem-hist'
            },
            {
                nome: ' Rastreamento',
                icone: 'fa fa-fw fa-map-marker menu-icon',
                url:'#/adm-rem-rast'
            },
            {
                nome: ' Perfil',
                icone: 'fa fa-fw fa-users menu-icon',
                url:'#/adm-rem-perf'
            }
        ];
    });
});