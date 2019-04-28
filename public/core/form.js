define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function ($stateParams, $window, apiService) {

        var c = this;

        c.init = function (form) {

            c.form = form;
            c.form.inst = {data: {}};
            c.form.caption = (($stateParams.id == 'new') ? 'Novo ' : '') + c.form.caption;

            if ($stateParams.id && $stateParams.id != 'new') {

                apiService.get(c.form.api + '/' + $stateParams.id)
                    .then(function (res) {
                        c.form.inst = res.data;
                    });
            }
        };

        c.save = function () {

            apiService.post(c.form.api, c.form.inst)
                .then(function (res) {
                    toastr["success"]("My name is Inigo Montoya. You killed my father. Prepare to die!");
                    var redirect = (c.form.redirect) ? c.form.redirect : c.form.api;
                    $window.location.href = '#/' + redirect;
                });
        };
    };

    return app.register.controller('formCtrl', ctrl);
});