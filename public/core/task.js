define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function ($stateParams, $window, apiService) {

        var c = this;

        c.init = function (task) {

            c.task = task;
            c.task.inst = {data: {}};

            if ($stateParams.id && $stateParams.id != 'new') {

                apiService.get(c.task.api + '/' + $stateParams.id)
                    .then(function (res) {
                        c.task.inst = res.data;
                    });
            }
        };

        c.save = function () {

            $("#myModal").modal("hide");

            apiService.post(c.task.api, c.task.inst).then(function (res) {
                toastr.info('Tarefa #' + res.data.id + ' salva com sucesso');

                setTimeout(function () {
                    $window.location.href = '#/' + c.task.redirect;
                }, 200);
            });
        };

        c.done = function () {
            apiService.post(c.task.api + "?done", c.task.inst).then(function (res) {
                toastr.success('Tarefa #' + res.data.id + ' concluída com sucesso');
                $window.location.href = '#/' + c.task.redirect;
            });
        };
    };

    return app.register.controller('taskCtrl', ctrl);
});