define(['app'], function (app) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.titulo = 'Menu de categorias';
        c.novaCategoria = {data: {}};

        apiService.get('categoria').then(function (msg) {

            c.categorias = msg.data.rows;
        });
    };

    return app.register.controller('rootCtrl', ctrl);
});