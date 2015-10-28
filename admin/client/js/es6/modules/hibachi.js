/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
//angular.module('hibachi',[]).config([(
// ) =>{
//
//}]);		
var hibachi;
(function (hibachi) {
    var appModule = angular.module("hibachi", []);
    hibachi.getModule = () => {
        return angular.module('hibachi');
    };
})(hibachi || (hibachi = {}));
var hibachi;
(function (hibachi) {
    var services;
    (function (services) {
        var appModule = angular.module("hibachi.services", []);
        services.getModule = () => {
            return angular.module('hibachi.services');
        };
    })(services = hibachi.services || (hibachi.services = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../modules/hibachi.js.map