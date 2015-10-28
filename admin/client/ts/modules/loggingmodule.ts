/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
//((): void => {
//	angular.module('logger', []).run([function() {
//    }]);
//})(); 
module logger{
    
    var appModule = angular.module("logger", []);
    
    export var getModule: () => ng.IModule = () =>{
        return angular.module('logger')    
    }
    
}

