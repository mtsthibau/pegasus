define(['../app'], function (app) {
        "use strict";


        app.directive('vendedores', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<ul class="col-md-12">' +
                '<h4 class="">{{c.tituloVendedores}}</h4>' +
                '<a ng-href="{{grupo.link}}">' +
                '<li class="active" ng-repeat="vendedor in vendedores">' +
                '<h5 class="menu-texto">{{vendedor.titulo}}</h5>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</div>'
            };
        });

        app.controller('vendedoresCtrl', function ($scope) {

            var c = this;

            c.tituloVendedores = 'Vendedores';


            $scope.vendedores = [
                {
                    titulo: 'Almaquinas',
                    link: ''
                },
                {
                    titulo: 'A Geradora',
                    link: ''
                },
                {
                    titulo: 'Ótima',
                    link: ''
                },
                {
                    titulo: 'Vilmaq',
                    link: ''
                },
                {
                    titulo: 'Atrevida',
                    link: ''
                }
            ]
        });
    }
);