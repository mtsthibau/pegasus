define(['app'], function (app) {
    "use strict";

    app.directive('slideitbanner', function () {
        return {
            restrict: 'A',
            replace: true,
            template: '<ul class="bxslider">' +
            '<li ng-repeat="banner in banners">' +
            '<img ng-src="../IMG/{{banner.data.banner}}" alt="" class="img-responsive"/>' +
            '</li>' +
            '</ul>',

            link: function (scope, elm, attrs) {
                elm.ready(function () {
                    $('#slider1').bxSlider({
                        mode: 'fade',
                        captions: true,
                        autoControls: true,
                        autoStart: true,
                        auto: true
                    });
                });
            }
        };
    });

    app.controller('slideitbannerCtrl', function ($scope, apiService) {
        var c = this;
        c.novoBanner = {data: {}};

        apiService.get('banner').then(function (msg) {

            $scope.banners = c.banners = msg.data.rows;
            //$scope.banners = c.banner.data.banner;
        });
    });
});
