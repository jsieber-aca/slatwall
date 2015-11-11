/// <reference path='../../../../typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../typings/tsd.d.ts' />

//import pagination = require('../services/paginationservice');
//var PaginationService = pagination.PaginationService;
//'use strict';

class SWPaginationBarController{
    public paginator;
    //@ngInject
    constructor(paginationService){
        if(angular.isUndefined(this.paginator)){
            this.paginator = paginationService.createPagination();    
        }
    }
}

 class SWPaginationBar implements ng.IDirective{
    
    public restrict:string = 'E';
    public scope = {};
    public bindToController={
        paginator:"="    
    };
    public controller=SWPaginationBarController
    public controllerAs="swPaginationBar";
    public templateUrl;
    //@ngInject
    
    constructor(partialsPath){
        this.templateUrl = partialsPath+'paginationbar.html';
    }
    public static factory():ng.IDirectiveFactory{
        var directive:ng.IDirectiveFactory = (partialsPath) => new SWPaginationBar(partialsPath);
        directive.$inject = [];
        return directive;    
    }
    
    public link:ng.IDirectiveLinkFn = (scope: ng.IScope, element: ng.IAugmentedJQuery, attrs:ng.IAttributes) =>{
        
    }
}

//class SWPaginationBarFactory{
//    public static getFactoryFor<T extends SWPaginationBar>(classType:Function):ng.IDirectiveFactory {
//        var factory = (...args:any[]):T=>{
//            var directive = <any>classType;
//            return new directive(args);
//        }
//        
//        factory.$inject = classType.$inject;
//        return factory;
//        // var directive: ng.IDirectiveFactory = 
//        //                ($log:ng.ILogService, $timeout:ng.ITimeoutService, partialsPath, paginationService) => new SWPaginationBar( $log,  $timeout, partialsPath,  paginationService); 
//        // directive.$inject = ['$log','$timeout','partialsPath','paginationService'];
//        // return directive;
//    }
//}
export = SWPaginationBar;

	//angular.module('hibachi.pagination').directive('swPaginationBar',['$log','$timeout','partialsPath','paginationService',($log,$timeout,partialsPath,paginationService) => new SWPaginationBar($log,$timeout,partialsPath,paginationService)]);

