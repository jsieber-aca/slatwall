/// <reference path='../../../../typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../typings/tsd.d.ts' />
class SWAddFilterButtons{
    
    public static Factory():ng.IDirectiveFactory{
        var directive:ng.IDirectiveFactory = (
            $http,
            $compile,
            $templateCache,
            collectionService,
            collectionPartialsPath) => new SWAddFilterButtons($http,
            $compile,
            $templateCache,
            collectionService,
            collectionPartialsPath);
            directive.$inject = [
            '$http',
            '$compile',
            '$templateCache',
            'collectionService',
            'collectionPartialsPath'
        ];
        return directive;    
    }
    //@ngInject
    constructor(
        $http,
        $compile,
        $templateCache,
        collectionService,
        collectionPartialsPath
    ){
        return {
          
          require:'^swFilterGroups',
          restrict: 'E',
          templateUrl:collectionPartialsPath+"addfilterbuttons.html",
          scope:{
              itemInUse:"=" 
          },   
          link: function(scope, element,attrs,filterGroupsController){
              scope.filterGroupItem = filterGroupsController.getFilterGroupItem();
              
              scope.addFilterItem = function(){
                  collectionService.newFilterItem(filterGroupsController.getFilterGroupItem(),filterGroupsController.setItemInUse);
              };
              
              scope.addFilterGroupItem = function(){
                  collectionService.newFilterItem(filterGroupsController.getFilterGroupItem(),filterGroupsController.setItemInUse,true);
              };
          }
      };
    }
}
export{
    SWAddFilterButtons
}

	