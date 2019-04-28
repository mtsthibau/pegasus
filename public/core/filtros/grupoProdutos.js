define(['../app'], function (app) {
        "use strict";


        app.directive('grupoProdutos', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<ul class="col-md-12">' +
                '<h4 class="">{{c.tituloGrupoProdutos}}</h4>' +
                '<a ng-href="{{grupo.link}}">' +
                '<li class="active" ng-repeat="grupo in grupos">' +
                '<h5 class="menu-texto">{{grupo.titulo}}</h5>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</div>'
            };
        });

        app.controller('grupoProdutosCtrl', function ($scope) {

            var c = this;

            c.tituloGrupoProdutos = 'Grupo de Produtos';


            $scope.grupos = [
                {
                    titulo: 'Andaime',
                    link: ''
                },
                {
                    titulo: 'Betoneira',
                    link: ''
                },
                {
                    titulo: 'Container',
                    link: ''
                },
                {
                    titulo: 'Ferramentas',
                    link: ''
                },
                {
                    titulo: 'Banheiro Químico',
                    link: ''
                }
            ]
        });
    }
);