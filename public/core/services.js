define(['app'], function (app) {
    "use strict";

    var toastr = require('toastr');
    var moment = require('moment');

//app.factory('$exceptionHandler', function () {
//    return function (exception, cause) {
//        exception.message += ' (caused by "' + cause + '")';
//        toastr.error(exception.message);
//        throw exception;
//    };
//});
//
//app.factory('authInterceptorService', ['$q', '$location', '$localStorage', function ($q, $location, $localStorage) {
//
//    var authInterceptorServiceFactory = {};
//    var UNEXPECTED_ERROR = 'Aconteceu um erro inesperado no tratamento desta solicitação. Notifique o suporte técnico.';
//
//    var _request = function (config) {
//
//        config.headers = config.headers || {};
//
//        var authData = $localStorage.authorizationData;
//        if (authData) {
//            config.headers.Authorization = 'Bearer ' + authData.token;
//        }
//
//        return config;
//    }
//
//    var _responseError = function (rejection) {
//
//        var msg = UNEXPECTED_ERROR;
//
//        switch (rejection.status) {
//            case 401: // unathorized
//            case 403: // forbidden
//                msg = 'Informe o usuário e senha para acessar este recurso no sistema.';
//                $location.path('#/');
//                break;
//            case 400: // bad request
//                if (rejection.data && rejection.data.error_description)
//                    msg = rejection.data.error_description;
//                if (rejection.data.modelState) {
//                    angular.forEach(rejection.data.modelState, function (value, key) {
//                        angular.forEach(value, function (msg) {
//                            toastr.error(msg);
//                        });
//                    });
//                    return $q.reject(rejection);
//                }
//                break;
//            case 500: // internal server error
//                if (rejection.data && rejection.data.exceptionMessage)
//                    msg = rejection.data.exceptionMessage;
//                break;
//        }
//
//        toastr.error(msg);
//        return $q.reject(rejection);
//    }
//
//    authInterceptorServiceFactory.request = _request;
//    authInterceptorServiceFactory.responseError = _responseError;
//
//    return authInterceptorServiceFactory;
//}]);

    app.factory('NotFoundInterceptorService', ['$q', '$location', '$localStorage', function ($q) {

        return {
            responseError: function (rejection) {

                switch (rejection.status) {
                    case 404: // not found
                        var msg = 'Ops! Página não encontrada';
                        history.back();
                        toastr.error(msg);
                        break;
                }

                return $q.reject(rejection);
            }
        };
    }]);

    app.config(function ($httpProvider) {

        $httpProvider.interceptors.push('NotFoundInterceptorService');

    });

    app.filter('fromNow', function () {
        return function (input) {
            return moment(input).fromNow();
        };
    });

    app.factory('apiService', function ($http) {

        var serviceBase = 'api/';
        var apiServiceFactory = {};

        //if (!$localStorage.authentication) {
        //
        //    $localStorage.authentication = {
        //        userName: "",
        //        fullName: "",
        //        lastLogin: "" // ultimo login que acessou o sistema com sucesso
        //    };
        //}

        var _get = function (resource, config) {
            return $http.get(serviceBase + resource, config);
        };

        var _post = function (resource, data, config) {
            return $http.post(serviceBase + resource, data, config);
        };

        var _delete = function (resource, config) {
            return $http.delete(serviceBase + resource, config);
        };

        //var _login = function (loginData) {
        //
        //    var data = "grant_type=password&username=" + loginData.userName + "&password=" + loginData.password;
        //    var deferred = $q.defer();
        //
        //    this.post('token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {
        //
        //        $localStorage.authorizationData = { token: response.access_token, userName: loginData.userName };
        //        $localStorage.authentication = { userName: loginData.userName, fullName: response.fullName, lastLogin: loginData.userName };
        //
        //        deferred.resolve(response);
        //
        //    }).error(function (err, status) {
        //        _logout();
        //        deferred.reject(err);
        //    });
        //
        //    return deferred.promise;
        //};
        //
        //var _logout = function () {
        //
        //    $localStorage.authorizationData = null;
        //    if ($localStorage.authentication) {
        //        $localStorage.authentication.userName = '';
        //        $localStorage.authentication.fullName = '';
        //    }
        //};
        //
        //var _forget = function () {
        //    $localStorage.authentication = null;
        //};

        // public methods
        apiServiceFactory.get = _get;
        apiServiceFactory.post = _post;
        apiServiceFactory.delete = _delete;
        //apiServiceFactory.login = _login;
        //apiServiceFactory.logout = _logout;
        //apiServiceFactory.forget = _forget;

        return apiServiceFactory;
    });
});