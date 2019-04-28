define(['app'], function (app) {
    "use strict";

    app.directive('sidebaradment', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<div class="col-md-3 menu-adm">' +
            '<ul class="nav">' +
            '<li ng-repeat="item in items" class="active">' +
            '<a ng-href="{{item.url}}" class="menu-texto"><i class="{{item.icone}}"></i>{{item.nome}}</a>' +
            '</li>' +

            '</ul>' +
            '</div>'
        };
    });

    app.controller('sidebarAdmEntCtrl', function ($scope) {
        $scope.items = [
            {
                nome: ' Início',
                icone: 'fa fa-home menu-icon',
                url:'#/adm-ent'
            },
            {
                nome: ' Histórico',
                icone: 'fa fa-fw fa-history menu-icon',
                url:'#/adm-ent-hist'
            },
            {
                nome: ' Entregas',
                icone: 'fa fa-fw fa-motorcycle menu-icon',
                url:'#/adm-ent-entr'
            },
            {
                nome: ' Perfil',
                icone: 'fa fa-fw fa-users menu-icon',
                url:'#/adm-ent-perf'
            } ,
            {
                nome: ' Pontuações',
                icone: 'fa fa-fw fa-trophy menu-icon',
                url:'#/adm-ent-pont'
            },
            {
                nome: ' Banco',
                icone: 'fa fa-fw fa-money menu-icon',
                url:'#/adm-ent-pont'
            }
        ];
    });
});