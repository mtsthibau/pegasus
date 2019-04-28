/**
 * Created by matheus on 01/04/2016.
 */
define(['app'], function (app) {
    'use strict';

    var ctrl = function () {

        var c = this;
        c.title = 'Pegasus';

    };

    return app.register.controller('contentAdmRemPerfilCtrl', ctrl);
});