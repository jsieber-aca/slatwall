
/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
module hibachi{
    
    var appModule = angular.module("hibachi", [
        'hibachi.model',
        'hibachi.services',
        'hibachi.filters',
        'hibachi.controllers',
        'hibachi.directives'
    ]);
    
    export var getModule: () => ng.IModule = () =>{
        return angular.module('hibachi');    
    }
    
    module model{
        var appModule = angular.module("hibachi.model", []);
        
        export var getModule: () => ng.IModule = () =>{
            return angular.module('hibachi.model');    
        }    
    }
    
    module services{
        import CollectionConfig = hibachi.services.CollectionConfig;
        var appModule = angular.module("hibachi.services", []);
        
        export var getModule: () => ng.IModule = () =>{
            return angular.module('hibachi.services');    
        }
    }
    
    module filters{
        var appModule = angular.module('hibachi.filters',[]);
        
        export var getModule: () => ng.IModule = () =>{
            return angular.module('hibachi.filters');    
        }
    }
    
    module controllers{
        
        var appModule = angular.module("hibachi.controllers", []);
        
        export var getModule: () => ng.IModule = () =>{
            return angular.module('hibachi.controllers');    
        }
    }
    
    module directives{
        var appModule = angular.module("hibachi.directives", []);
        
        export var getModule: () => ng.IModule = () =>{
            return angular.module('hibachi.directives');    
        }    
    }
    
};
