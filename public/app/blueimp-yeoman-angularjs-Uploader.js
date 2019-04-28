//define(['app'], function (app) {
//    'use strict';
//
//    angular.module('app')
//        .controller('UploaderCtrl', function ($scope, fileUpload) {
//            var baseUrl = 'http://localhost:3030/test-upload/index.php';
//
//            $scope.options = {
//                autoUpload: true,
//                maxChunkSize: 1024 * 1024, // = 1Mo
//                add: function (e, data) {
//                    data.url = baseUrl + '?folder=' + $scope.folder;
//                    fileUpload.defaults.add(e, data);
//                },
//                done: function (e, data) {
//                    data.result.uploaded = true;
//                    data.result.files = [data.result];
//                    fileUpload.defaults.done(e, data);
//                },
//                fail: function (e, data) {
//                    data.textStatus = 'error';
//                    data.errorThrown = data.result.reason + ' (' + data.result.errorCode + ')';
//                    fileUpload.defaults.fail(e, data);
//                },
//                formData: function () {
//                    return [{name: 'sessionId', value: $scope.sessionId}];
//                }
//            };
//
//            $scope.emptyUploadList = function () {
//                while ($scope.queue.length) {
//                    $scope.clear($scope.queue[0]);
//                }
//            };
//
//            $scope.removeFileFromUploadList = function (file) {
//                $scope.clear(file);
//            };
//        });
//});