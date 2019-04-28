define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function ($window, apiService) {

        var c = this;

        c.init = function (child) {

            c.props = child;
            c.props.delete = c.delete;

            apiService.get(c.props.api).then(function (res) {
                c.props.items = res.data.rows;
            });

        };

        c.delete = function (item) {
            apiService.delete(c.props.api + '/' + item.id).then(function (res) {

                var index = c.props.items.indexOf(item);
                c.props.items.splice(index, 1);

                toastr.success('Registro #' + res.data.id + ' excluído');
            });
        };
    };

    return app.register.controller('viewCtrl', ctrl);
});