define(['../app'], function (app) {
        "use strict";


        app.directive('marcas', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<ul class="col-md-12">' +
                '<h4 class="">{{c.tituloMarcas}}</h4>' +
                '<a ng-href="{{grupo.link}}">' +
                '<li class="active" ng-repeat="marca in marcas">' +
                '<h5 class="menu-texto">{{marca.titulo}}</h5>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</div>'
            };
        });

        app.controller('marcasCtrl', function ($scope) {

            var c = this;

            c.tituloMarcas = 'Marcas';


            $scope.marcas = [
                {
                    titulo: 'CSM',
                    link: ''
                },
                {
                    titulo: 'Manegotti',
                    link: ''
                },
                {
                    titulo: 'Bosch',
                    link: ''
                },
                {
                    titulo: 'Caterpillar',
                    link: ''
                },
                {
                    titulo: 'Linde',
                    link: ''
                }
            ]
        });
    }
);