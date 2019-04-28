define(['app'], function (app) {
    "use strict";

    app.directive('slideitdestaque', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<ul class="bxslider col-md-12 col-xs-12 lista-produtos">' +
            '<li class="col-md-4 col-xs-12 produto" ng-repeat="d in destaques">' +
            '<a href="#">' +
            '<div><div><img class="col-md-12 col-xs-12 img-responsive imagem-produto" ng-src="../IMG/{{d.data.foto}}" alt=""/></div>' +
            '<div class="col-md-12 col-xs-12">' +
            '<span class="titulo-produto-listagem">{{d.data.nome}}</span>' +
            '</div>' +
            '<span class="localizacao-produto">{{d.data.cidade}}</span>' +
            '<button class="btn-lg btn-info btn-green glyphicon glyphicon-piggy-bank col-md-12 col-xs-12"><span>Orçamento!</span></button>' +
            '</div></a>' +
            '</li>' +
            '</ul>',


            link: function (scope, elm, attrs) {
                elm.ready(function () {
                    $('#slider2').bxSlider({
                        autoStart: true,
                        autoControls: true,
                        slideWidth: 400,
                        minSlides: 3,
                        maxSlides: 3,
                        slideMargin: 1,
                        moveSlides: 1,
                        async: true
                    });
                });
            }
        };
    });

    app.controller('slideitdestaqueCtrl', function ($scope, apiService) {
        var c = this;
        c.novoDestaque = {data: {}};

        apiService.get('destaque').then(function (msg) {

            $scope.destaques = c.destaques = msg.data.rows;
            console.log($scope.destaques);
            //$scope.banners = c.banner.data.banner;
        });
    });
});
