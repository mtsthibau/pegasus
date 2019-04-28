define(['app'], function (app) {
    'use strict';

    var ctrl = function ($scope) {

        var c = this;

        c.caption = 'Abrir Solicitação';
        c.api = 'action/sac/atendimento/solicitacao';
        c.redirect = 'action/sac/atendimento';

        $scope.$parent.c.init(c);

        //apiService.get('process/plugin/' + $stateParams.plugin + "/" + $stateParams.name).then(function (res) {
        //    c.process = res.data;
        //
        //    var tasks = c.process.data.tasks.filter(function (t) {
        //        return t.route === $routeParams.item;
        //    });
        //
        //    c.task = tasks[0];
        //});
    };

    return app.register.controller('sacAtendimentoSolicitacaoTask', ctrl);
});