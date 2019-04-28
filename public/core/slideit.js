//define(['app'], function (app) {
//    "use strict";
//
//    app.directive('BannerEditor', function () {
//       return {
//            myInterval:  3000,
//            images : [
//                {
//                    src: 'http://lorempixel.com/400/200/'
//                },
//                {
//                    src: 'http://lorempixel.com/400/200/food'
//                },
//                {
//                    src: 'http://lorempixel.com/400/200/sports'
//                },
//                {
//                    src: 'http://lorempixel.com/400/200/people'
//                }
//            ]
//
//        }
//    });
//
//});

//define(['app'], function (app) {
//    "use strict";
//
////var app = angular.module('plunker', []);
//
//    app.directive('banner', function () {
//        return {
//            restrict: 'A',
//            replace: true,
//            templateurl: 'core/slideit.html',
//
//            scope: {
//                slideit: '='
//            },
//
//
//            link: function (scope, elm, attrs) {
//                elm.ready(function () {
//                    scope.$apply(function () {
//                        scope.slides = scope.slideit;
//                    });
//                    elm.bxSlider({
//                        adaptiveHeight: true,
//                        mode: 'fade'
//                    });
//                });
//            }
//        };
//    });
//
//    app.controller('MainCtrl', function ($scope) {
//        $scope.base = 'http://bxslider.com';
//        $scope.images = [
//            {src: $scope.base + '/images/730_200/hill_fence.jpg'},
//            {src: $scope.base + '/images/730_100/tree_root.jpg'},
//            {src: $scope.base + '/images/730_150/me_trees.jpg'}
//        ]
//    });
//});


//var app = angular.module('plunker', []);
//
//app.directive('slideit',function() {
//    return {
//        restrict: 'A',
//        replace: true,
//        scope: {
//            slideit: '='
//        },
//        template: '<ul class="bxslider">' +
//        '<li ng-repeat="slide in slides">' +
//        '<img ng-src="{{slide.src}}" alt="" />' +
//        '</li>' +
//        '</ul>',
//        link: function(scope, elm, attrs) {
//            elm.ready(function() {
//                scope.$apply(function() {
//                    scope.slides = scope.slideit;
//                });
//                elm.bxSlider({
//                    adaptiveHeight: true,
//                    mode: 'fade'});
//            });
//        }
//    };
//});
//
//app.controller('MainCtrl', function($scope) {
//    $scope.base = 'http://bxslider.com';
//    $scope.images = [
//        {src: $scope.base + '/images/730_200/hill_fence.jpg' },
//        {src: $scope.base + '/images/730_100/tree_root.jpg' },
//        {src: $scope.base + '/images/730_150/me_trees.jpg' }
//    ];
//});

//
//define(['app'], function (app) {
//    "use strict";



var app = angular.module('app', []);


    app.directive('slideit',function() {
        return {
            restrict: 'A',
            replace: true,
            scope: {
                slideit: '='
            },
            template: '<ul class="bxslider">' +
            '<li ng-repeat="slide in slides">' +
            '<img ng-src="{{slide.src}}" alt="" />' +
            '</li>' +
            '</ul>',

        };
    });

    app.controller('slideitbannerCtrl', function($scope) {
        $scope.base = 'http://bxslider.com';
        $scope.images = [
            {src: $scope.base + '/images/730_200/hill_fence.jpg' },
            {src: $scope.base + '/images/730_100/tree_root.jpg' },
            {src: $scope.base + '/images/730_150/me_trees.jpg' }
        ];
    });

//});