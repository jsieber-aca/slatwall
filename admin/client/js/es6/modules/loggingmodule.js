/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
//((): void => {
//	angular.module('logger', []).run([function() {
//    }]);
//})(); 
var logger;
(function (logger) {
    var appModule = angular.module("logger", []);
    logger.getModule = () => {
        return angular.module('logger');
    };
})(logger || (logger = {}));

//# sourceMappingURL=../modules/loggingmodule.js.map