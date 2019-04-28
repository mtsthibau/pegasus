require.config({
    paths: {
        jquery: "../vendor/jquery/dist/jquery.min",
        bootstrap: "../vendor/bootstrap/dist/js/bootstrap.min",
        toastr: "../vendor/toastr/toastr.min",
        angular: "../vendor/angular/angular.min",
        uiRouter: "../vendor/angular-ui-router/release/angular-ui-router.min",
        ngMessages: "../vendor/angular-messages/angular-messages.min",
        ngStorage: "../vendor/ngstorage/ngStorage.min",
        moment: "../vendor/moment/min/moment.min",
        momentLocales: "../vendor/moment/min/locales.min",
        bxslider: "../vendor/jquery.bxslider/jquery.bxslider.min"
        //,
        //loadsh: "../../node_modules/angular-google-maps/node_modules/lodash/lodash.min.js",
        //simple: "../../node_modules/angular-google-maps/node_modules/angular-simple-logger/dist/angular-simple-logger.min.js",
        //uimaps: "../../node_modules/angular-google-maps/dist/angular-google-maps.min.js"

    },
    shim: {
        jquery: {exports: "$"},
        bootstrap: {deps: ['jquery']},
        angular: {exports: "angular"},
        uiRouter: {deps: ["angular"]},
        ngMessages: {deps: ["angular"]},
        ngStorage: {deps: ["angular"]},
        //simple: {deps: ["angular"]},
        //uimaps: {deps: ["angular"]},
        bxslider: {deps: ["jquery"]}
    },
    deps: [
        'jquery',
        'bootstrap',
        'khandler',
        'toastr',
        'angular',
        'uiRouter',
        'ngMessages',
        'ngStorage',
        'moment',
        'momentLocales',
        'bxslider'
    ]
});

require([
        'app',
        'bxslider',
        'slideitbanner',
        'slideitdestaque',
        'services',
        'resultadoPesquisa',
        'sidebaradmadmin',
        'sidebaradment',
        'sidebaradmrem',
        //'map',
        'filtros/sidebarFiltros',
        'filtros/palavraChave',
        'filtros/grupoProdutos',
        'filtros/marcas',
        'filtros/vendedores',
        'filtros/modelos',
        'filtros/localidades'


        //'filtros/palavraChave'
    ],
    function (app) {
        app.init();
    });
