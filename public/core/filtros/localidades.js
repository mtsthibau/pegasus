define(['../app'], function (app) {
        "use strict";


        app.directive('localidades', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<ul class="col-md-12">' +
                '<h4 class="">{{c.tituloLocalidades}}</h4>' +
                '<a ng-href="{{grupo.link}}">' +
                '<li class="active" ng-repeat="localidade in localidades">' +
                '<h5 class="menu-texto">{{localidade.titulo}}</h5>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</div>'
            };
        });

        app.controller('localidadesCtrl', function ($scope) {

            var c = this;

            c.tituloLocalidades = 'Localização';


            $scope.localidades = [
                {
                    titulo: 'Minas Gerais',
                    link: ''
                },
                {
                    titulo: 'São Paulo',
                    link: ''
                },
                {
                    titulo: 'Espírito Santo',
                    link: ''
                },
                {
                    titulo: 'Rio de Janeiro',
                    link: ''
                },
                {
                    titulo: 'Santa Catarina',
                    link: ''
                }
            ]
        });
    }
);