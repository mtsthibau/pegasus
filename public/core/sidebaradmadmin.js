/**
 * Created by matheus on 30/03/2016.
 */
define(['app'], function (app) {
    "use strict";

    app.directive('sidebaradmadmin', function () {
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

    app.controller('sidebarAdmAdminCtrl', function ($scope) {
        $scope.items = [
            {
                nome: ' Início',
                icone: 'fa fa-home menu-icon',
                url:'#/adm-admin'
            },
            {
                nome: ' Banners',
                icone: 'fa fa-fw fa-image menu-icon',
                url:'#/adm-admin-banner'
            },
            {
                nome: ' Categorias',
                icone: 'fa fa-fw fa-tags menu-icon',
                url:'#/adm-admin-categorias'
            },
            {
                nome: ' Destaques',
                icone: 'fa fa-fw fa-star menu-icon',
                url:'#/adm-admin-destaques'
            },
            {
                nome: ' Entregadores',
                icone: 'fa fa-fw fa-motorcycle menu-icon',
                url:'#/adm-admin-entregador'
            }
        ];
    });
});