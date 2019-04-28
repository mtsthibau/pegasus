define(['app'], function (app) {
    "use strict";

    app.directive('resultadopesquisa', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<ul>' +
            '<li class="col-md-12 col-xs-12 produto-pesquisa img-responsive" ng-repeat="produto in produtos">' +
            '<a href="#">' +
            '<div class="col-md-9 col-xs-12">' +
            '<img class="col-md-4 col-xs-12 img-responsive imagem-produto" ng-src="{{produto.imgSrc}}" alt=""/>' +
            '<span class="col-md-7 titulo-produto-listagem titulo-produto-pesquisa">{{produto.titulo}}</span>' +
            '<span class="col-md-6 localizacao-produto localizacao-produto-pesquisa">{{produto.localizacao}}</span>' +
            '<img class="col-md-3 logo-locadora img-responsive" ng-src="{{produto.imgLogo}}"/>' +
            '</div>' +
            '<div>' +
            '<span class="col-md-2 preco-pesquisa">R$ 569,00</span>' +
            '<button class="btn-lg btn-green btn-orcamento-pesquisa glyphicon glyphicon-share-alt col-md-2 col-xs-12"><span>Veja Mais</span></button>' +
            '</div></a>' +
            '</li>' +
            '</ul>'

        };
    });

    app.controller('resultadoPesquisaCtrl', function ($scope) {

        $scope.produtos = [
            {
                imgSrc: '../img/caterpillar-geh-275,701d1e69.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gerador Caterpillar GEH 275 Ano 2005',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/john-deere-x740,1989161-1%20(1).jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gadanheiras John Deere X740',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/manitou-160-atj-4x4x4-16-5m-se,742c341c.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Plataforma Aérea Manitou 160ATJ',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/caterpillar-geh-275,701d1e69.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gerador Caterpillar GEH 275 Ano 2005',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/john-deere-x740,1989161-1%20(1).jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gadanheiras John Deere X740',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/manitou-160-atj-4x4x4-16-5m-se,742c341c.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Plataforma Aérea Manitou 160ATJ',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/caterpillar-geh-275,701d1e69.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gerador Caterpillar GEH 275 Ano 2005',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/john-deere-x740,1989161-1%20(1).jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Gadanheiras John Deere X740',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/manitou-160-atj-4x4x4-16-5m-se,742c341c.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Plataforma Aérea Manitou 160ATJ',
                localizacao: 'Belo Horizonte - Minas Gerais'
            },
            {
                imgSrc: '../img/manitou-160-atj-4x4x4-16-5m-se,742c341c.jpg',
                imgLogo: '../img/logo-geradora.png',
                titulo: 'Plataforma Aérea Manitou 160ATJ',
                localizacao: 'Belo Horizonte - Minas Gerais'
            }
        ];
    });
});

