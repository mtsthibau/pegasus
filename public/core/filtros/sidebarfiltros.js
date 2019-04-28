define(['../app'], function (app) {
    "use strict";

    app.directive('sidebarFiltros', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<div>' +
            '<div palavra-chave ng-controller="palavraChaveCtrl as c">' +
            '</div>' +
            '<div grupo-produtos="grupos" ng-controller="grupoProdutosCtrl as c">' +
            '</div>' +
            '<div marcas="marcas" ng-controller="marcasCtrl as c">' +
            '</div>' +
            '<div vendedores="vendedores" ng-controller="vendedoresCtrl as c">' +
            '</div>' +
            '<div modelos="modelos" ng-controller="modelosCtrl as c">' +
            '</div>' +
            '<div localidades="localidades" ng-controller="localidadesCtrl as c">' +
            '</div>' +
            '</div>'
        };
    });

    app.controller('sidebarFiltrosCtrl', function ($scope) {
        $scope.palavraChaves = [
            {
                nome: 'Palavra-chave',
                btn: 'Filtrar'
            }];
    });
});

//'<li><h4>{{input.nome}}</h4>' +
//'<input>' +
//'<button class="btn btn-green">{{input.btnFiltrar}}</button></li>' +
//{
//    nome: 'Variação de preço'
//},
//{
//    nome: 'Marca'
//},
//{
//    nome: 'Modelo'
//},
//{
//    nome: 'Tipo'
//},
//{
//    nome: 'Ano'
//},
//{
//    nome: 'Lojas'
//},
//{
//    nome: 'Localização'
//}