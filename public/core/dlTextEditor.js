define(['app'], function (app) {
    "use strict";

    app.directive('dlTextEditor', function () {
        return {
            restrict: 'E', // restrict to element
            replace: true, // faz o replace do html
            templateUrl: 'core/dlTextEditor.html', // arquivo de template
            scope: {
                name: '@',
                text: '@',
                model: '='
            }
        };
    });
});