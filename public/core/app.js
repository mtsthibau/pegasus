define(function (require) {

    'use strict';

    var angular = require('angular');
    var uiRouter = require('uiRouter');
    var ngStorage = require('ngStorage');
    var ngMessages = require('ngMessages');
    var routes = require('routes');
    var moment = require('moment');

    var app = angular.module('app', ['ui.router', 'ngMessages', 'ngStorage', /*'chieffancypants.loadingBar'*/]);

    app.init = function () {
        angular.bootstrap(document.getElementById('ng-app'), ['app']);
    };

    app.config(['$stateProvider', '$urlRouterProvider', '$controllerProvider',
        function ($stateProvider, $urlRouterProvider, $controllerProvider) {

            // necessario para registrar os controller carregados dinamicamente
            app.register = {
                controller: $controllerProvider.register
            };

            $urlRouterProvider.otherwise("/");

            $stateProvider
                .state('root', routes.resolveAbstract('core/root'))
                .state('root.content-home', routes.resolvePath('/', 'app/content-home'))
                .state('root.content-atualizar-senha', routes.resolvePath('/senhas', 'app/content-atualizar-senha'))
                .state('root.content-login', routes.resolvePath('/login', 'app/content-login'))
                .state('root.content-pesquisa', routes.resolvePath('/pesquisa', 'app/content-pesquisa'))
                .state('root.content-politica-privacidade', routes.resolvePath('/politica-privacidade', 'app/content-politica-privacidade'))
                .state('root.content-termo-uso', routes.resolvePath('/termo-uso', 'app/content-termo-uso'))
                .state('root.content-sac', routes.resolvePath('/sac', 'app/content-sac'))
                .state('root.content-pegasus-portal', routes.resolvePath('/pegasus-portal', 'app/content-pegasus-portal'))


                .state('root.content-adm-ent', routes.resolvePath('/adm-ent', 'app/content-adm-ent'))
                .state('root.content-adm-ent-hist', routes.resolvePath('/adm-ent-hist', 'app/content-adm-ent-hist'))
                .state('root.content-adm-ent-perfil', routes.resolvePath('/adm-ent-perf', 'app/content-adm-ent-perfil'))
                //.state('root.content-adm-ent-banco', routes.resolvePath('/adm-ent-perf', 'app/content-adm-ent-perfil'))
                //.state('root.content-adm-ent-pontuacao', routes.resolvePath('/adm-ent-perf', 'app/content-adm-ent-perfil'))


                .state('root.content-adm-admin', routes.resolvePath('/adm-admin', 'app/content-adm-admin'))
                .state('root.content-adm-admin-banner', routes.resolvePath('/adm-admin-banner', 'app/content-adm-admin-banner'))
                .state('root.content-adm-admin-categorias', routes.resolvePath('/adm-admin-categorias', 'app/content-adm-admin-categorias'))
                .state('root.content-adm-admin-destaques', routes.resolvePath('/adm-admin-destaques', 'app/content-adm-admin-destaques'))
                .state('root.content-adm-admin-entregador', routes.resolvePath('/adm-admin-entregador', 'app/content-adm-admin-entregador'))
                .state('root.content-adm-admin-bloquear', routes.resolvePath('/adm-admin-bloquear', 'app/content-adm-admin-bloquear'))
                //.state('root.content-adm-admin-perfil', routes.resolvePath('/edit-admin', 'app/content-adm-admin-perfil'))
                //.state('root.content-adm-admin-tipos', routes.resolvePath('/edit-admin', 'app/content-adm-admin-perfil'))


                .state('root.content-adm-rem', routes.resolvePath('/adm-rem', 'app/content-adm-rem'))
                .state('root.content-adm-rem-post', routes.resolvePath('/adm-rem-post', 'app/content-adm-rem-post'))
                .state('root.content-adm-rem-hist', routes.resolvePath('/adm-rem-hist', 'app/content-adm-rem-hist'))
                .state('root.content-adm-rem-perf', routes.resolvePath('/adm-rem-perf', 'app/content-adm-rem-perf'))
                .state('root.content-adm-rem-rastrear', routes.resolvePath('/adm-rem-rast', 'app/content-adm-rem-rastrear'))
            ;
        }]);

    //app.config(['$locationProvider'], function ($locationProvider) {
    //    $locationProvider.html5Mode(true);
    //});

//.config(['cfpLoadingBarProvider', function (cfpLoadingBarProvider) {
//    cfpLoadingBarProvider.includeSpinner = false;
//}])
//
    var toastr = require('toastr');
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    moment.locale('pt-br');

    return app;
});


