define(['../app'], function (app) {
        "use strict";


        app.directive('palavraChave', function () {
            return {
                restrict: 'A',
                replace: true,
                template: '<div class="col-md-12">' +
                '<h4 class="">{{c.tituloPalavraChave}}</h4>' +
                '<div class="input-group">' +
                '<input type="text" class="form-control" placeholder="">' +
                '<span class="input-group-btn">' +
                '<button class="btn btn-default btn-filtrar" type="button">{{c.btnPalavraChave}}</button>' +
                '</span>' +
                '</div>' +
                '</div>'
            };
        });

        app.controller('palavraChaveCtrl', function () {

            var c = this;

            c.tituloPalavraChave = 'Palavra-chave';
            c.btnPalavraChave = 'Filtrar'

        });
    }
);