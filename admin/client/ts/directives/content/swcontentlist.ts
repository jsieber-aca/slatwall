/// <reference path='../../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../../client/typings/tsd.d.ts' />


module slatwalladmin {
    'use strict';
    
    export class SWContentListController{
        public static $inject = [
            '$scope',
            '$log',
            '$timeout',
            '$slatwall',
            'paginationService',
            'observerService',
            'collectionConfigService'
        ];
        constructor(
            private $scope:ng.IScope,
            private $log:ng.ILogService,
            private $timeout:ng.ITimeoutService,
            private $slatwall:ngSlatwall.$Slatwall,
            private paginationService:slatwalladmin.PaginationService,
            private observerService:slatwalladmin.ObserverService,
            private collectionConfigService:slatwalladmin.CollectionService
        ){
               this.openRoot = true;
               this.$log.debug('slatwallcontentList init');
	           var pageShow = 50;
               if(this.pageShow !== 'Auto'){
                   pageShow = this.pageShow;
               }
               
               this.pageShowOptions = [
                   {display:10,value:10},
                   {display:20,value:20},
                   {display:50,value:50},
                   {display:250,value:250}
               ];
               
               this.loadingCollection = false;
               
               this.selectedSite;
               this.orderBy;
               var orderByConfig;
               
	        	this.getCollection = (isSearching)=>{
                   this.collectionConfig = collectionConfigService.newCollectionConfig('Content');
                   
                   
                   var columnsConfig = [
                       //{"propertyIdentifier":"_content_childContents","title":"","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"childContentsCount"}},
                       {
                           propertyIdentifier:'_content.contentID',
                           isVisible:false,
                           ormtype:'id',
                           isSearchable:true
                       },
                       {
                               propertyIdentifier: '_content.urlTitlePath',
                               isVisible: false,
                               isSearchable: true
                       },
                       //need to get template via settings
                       {
                           propertyIdentifier:'_content.allowPurchaseFlag',
                           isVisible:true,
                           ormtype:'boolean',
                           isSearchable:false
                       }, 
                       {
                           propertyIdentifier:'_content.productListingPageFlag',
                           isVisible:true,
                           ormtype:'boolean',
                           isSearchable:false
                       },
                       {
                           propertyIdentifier:'_content.activeFlag',
                           isVisible:true,
                           ormtype:'boolean',
                           isSearchable:false
                       }
                   ];
                   
                   
                   
	        		var options = {
                       currentPage:'1', 
                       pageShow:'1', 
                       keywords:this.keywords
                   };
                   var column = {};
                   if(!isSearching || this.keywords === ''){
                      
                       this.isSearching = false;
                        var filterGroupsConfig =[
                           {
                             "filterGroup": [
                               {
                                 "propertyIdentifier": "parentContent",
                                 "comparisonOperator": "is",
                                 "value": 'null'
                               }
                             ]
                           }
                         ];
                        column = {
                           propertyIdentifier:'_content.title',
                           isVisible:true,
                           ormtype:'string',
                           isSearchable:true,
                           tdclass:'primary'
                       };
                       columnsConfig.unshift(column);
                   }else{
                       this.collectionConfig.setKeywords(this.keywords);
                       this.isSearching = true;
                       var filterGroupsConfig =[
                           {
                             "filterGroup": [
                               {
                                 "propertyIdentifier": "excludeFromSearch",
                                 "comparisonOperator": "!=",
                                 "value": true
                               }
                             ]
                           }
                         ];
                      column = {
                           propertyIdentifier:'_content.title',
                           isVisible:false,
                           ormtype:'string',
                           isSearchable:true
                       };
                       columnsConfig.unshift(column);

                       var titlePathColumn = {
                           propertyIdentifier:'_content.titlePath',
                           isVisible:true,
                           ormtype:'string',
                           isSearchable:false
                       };  
                       columnsConfig.unshift(titlePathColumn);
                   }
                   //if we have a selected Site add the filter
                   if(angular.isDefined(this.selectedSite)){
                       var selectedSiteFilter = {
                           logicalOperator:"AND",
                           propertyIdentifier:"site.siteID",
                           comparisonOperator:"=",
                           value:this.selectedSite.siteID
                       };
                       filterGroupsConfig[0].filterGroup.push(selectedSiteFilter);
                   }
                   
                   if(angular.isDefined(this.orderBy)){
                       var orderByConfig = [];
                       orderByConfig.push(this.orderBy);    
                       options.orderByConfig = angular.toJson(orderByConfig);
                   }
                   
                   angular.forEach(columnsConfig,(column)=>{
                       this.collectionConfig.addColumn(column.propertyIdentifier,column.title,column);
                   });
                   this.collectionConfig.addDisplayAggregate('childContents','COUNT','childContentsCount',{isVisible:false,isSearchable:false,title:'test'});
                   this.collectionConfig.addDisplayProperty(
                       'site.siteID',
                       undefined,
                       {
                           isVisible:false,
                           ormtype:'id',
                           isSearchable:false
                        }
                   );
                   this.collectionConfig.addDisplayProperty(
                       'site.domainNames',
                       undefined,
                       {
                            isVisible: false,
                            isSearchable: true
                       }
                   );
                   
                   angular.forEach(filterGroupsConfig[0].filterGroup,(filter)=>{
                       
                       this.collectionConfig.addFilter(filter.propertyIdentifier,filter.value,filter.comparisonOperator,filter.logicalOperator);
                   });
                   
                   this.collectionListingPromise = this.collectionConfig.getEntity();
	        		this.collectionListingPromise.then((value)=>{
                        this.$timeout(()=>{
                            this.collection = value;
                            this.collection.collectionConfig = this.collectionConfig;
                            
                            this.firstLoad = true;
                            this.loadingCollection = false;
                        });
                        
	        		});
                    return this.collectionListingPromise;
	        	};
	        	//this.getCollection(false);
               
               
               this.loadingCollection = false;
               this.searchCollection = ()=>{
                  
                   $log.debug('search with keywords');
                   $log.debug(this.keywords);
                   $('.childNode').remove();
                   //Set current page here so that the pagination does not break when getting collection
                  this.loadingCollection = true;
                   var promise = this.getCollection(true);
                   promise.then(()=>{
                       this.collection.collectionConfig = this.collectionConfig;
                        
                   });
               };
              
               
           var siteChanged = (selectedSiteOption)=>{
               this.selectedSite = selectedSiteOption;
               this.openRoot = true;
               this.getCollection();
           }
           
           this.observerService.attach(siteChanged,'optionsChanged','siteOptions');
               
           var sortChanged = (orderBy)=>{
               this.orderBy = orderBy;
               this.getCollection();
           };
           this.observerService.attach(sortChanged,'sortByColumn','siteSorting');
           
           var optionsLoaded = ()=>{
               this.observerService.notify('selectFirstOption');
               
           }
           this.observerService.attach(optionsLoaded,'optionsLoaded','siteOptionsLoaded');
               
           
        }
    }
    export class SWContentList implements ng.IDirective{
        
        public restrict:string = 'E';
        
        //public bindToController=true;
        public controller=SWContentListController;
        public controllerAs="swContentList";
        public templateUrl;
        
        constructor(
             private partialsPath,
             private observerService
        ){
            this.templateUrl = this.partialsPath+'content/contentlist.html';
        } 
        
        public link:ng.IDirectiveLinkFn = (scope: ng.IScope, element: ng.IAugmentedJQuery, attrs:ng.IAttributes,controller, transclude) =>{
            scope.$on('$destroy', function handler() {
               observerService.detachByEvent('optionsChanged');
               observerService.detachByEvent('sortByColumn');
           });
        }
    }
    
    angular.module('slatwalladmin').directive('swContentList',['partialsPath','observerService',(partialsPath,observerService) => new SWContentList(partialsPath,observerService)]);   
    
}

