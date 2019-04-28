define(['../app'], function (app) {
        "use strict";


        app.directive('modelos', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<ul class="col-md-12">' +
                '<h4 class="">{{c.tituloModelos}}</h4>' +
                '<a ng-href="{{grupo.link}}">' +
                '<li class="active" ng-repeat="modelo in modelos">' +
                '<h5 class="menu-texto">{{modelo.titulo}}</h5>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</div>'
            };
        });

        app.controller('modelosCtrl', function ($scope) {

            var c = this;

            c.tituloModelos = 'Modelos';


            $scope.modelos = [
                {
                    titulo: '130X2',
                    link: ''
                },
                {
                    titulo: '160X2',
                    link: ''
                },
                {
                    titulo: '210X2',
                    link: ''
                },
                {
                    titulo: '240X2',
                    link: ''
                },
                {
                    titulo: '290X2',
                    link: ''
                }
            ]
        });
    }
);