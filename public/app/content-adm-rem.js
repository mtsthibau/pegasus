define(['app'], function (app) {
    'use strict';

    var ctrl = function () {

        var c = this;
        c.title = 'Pegasus';

    };

    return app.register.controller('contentadmremCtrl', ctrl);
});