define(['app'], function (app) {
    "use strict";

    app.directive('dlMemoEditor', function () {
        return {
            restrict: 'E', // restrict to element
            replace: true, // faz o replace do html
            templateUrl: 'core/dlMemoEditor.html', // arquivo de template
            scope: {
                name: '@',
                text: '@',
                model: '='
            }
        };
    });
});