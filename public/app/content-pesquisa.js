/**
 * Created by matheus.thibau on 11/11/2015.
 */
define(['app'], function (app) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.retorno = '';
        c.tipoRetorno = '';
        c.novoFiltro = {data: {}};

        apiService.get('filtro').then(function (msg) {

            c.categorias = msg.data.rows;
        });
    };

    return app.register.controller('contentPesquisaCtrl', ctrl);
});




