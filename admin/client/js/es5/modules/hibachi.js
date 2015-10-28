/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
var hibachi;
(function (hibachi) {
    var appModule = angular.module("hibachi", [
        'hibachi.model',
        'hibachi.services',
        'hibachi.filters',
        'hibachi.controllers',
        'hibachi.directives'
    ]);
    hibachi.getModule = function () {
        return angular.module('hibachi');
    };
    var model;
    (function (model) {
        var appModule = angular.module("hibachi.model", []);
        model.getModule = function () {
            return angular.module('hibachi.model');
        };
    })(model || (model = {}));
    var services;
    (function (services) {
        var appModule = angular.module("hibachi.services", []);
        services.getModule = function () {
            return angular.module('hibachi.services');
        };
    })(services || (services = {}));
    var filters;
    (function (filters) {
        var appModule = angular.module('hibachi.filters', []);
        filters.getModule = function () {
            return angular.module('hibachi.filters');
        };
    })(filters || (filters = {}));
    var controllers;
    (function (controllers) {
        var appModule = angular.module("hibachi.controllers", []);
        controllers.getModule = function () {
            return angular.module('hibachi.controllers');
        };
    })(controllers || (controllers = {}));
    var directives;
    (function (directives) {
        var appModule = angular.module("hibachi.directives", []);
        directives.getModule = function () {
            return angular.module('hibachi.directives');
        };
    })(directives || (directives = {}));
})(hibachi || (hibachi = {}));
;

//# sourceMappingURL=../modules/hibachi.js.map