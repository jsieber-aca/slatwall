'use strict';
//Thanks to AdamMettro
angular.module('slatwalladmin')
.directive('swDetail', [
	'$location',
	'$log',
	'$slatwall',
	'partialsPath',
	function (
		$location,
		$log,
		$slatwall,
		partialsPath
	) {
	    return {
	        restrict: 'E',
	        templateUrl:partialsPath+'entity/detail.html',
	        link: function (scope, element, attr) {
	        	scope.$id="slatwallDetailController";
	        	$log.debug('slatwallDetailController');
	        
            /*Sets the view dirty on save*/
            scope.setDirty = function(entity){  
                angular.forEach(entity.forms,function(form){
                    form.$setSubmitted();
                });    
            };  
	        	var setupMetaData = function(){
	        		scope[scope.entityName.toLowerCase()] = scope.entity;
	        		scope.entity.metaData.$$getDetailTabs().then(function(value){
                        scope.detailTabs = value.data;
                        $log.debug('detailtabs');
                        $log.debug(scope.detailTabs);
                    });
	        		
	        	};
	        	
	        	var propertyCasedEntityName = scope.entityName.charAt(0).toUpperCase() + scope.entityName.slice(1);
	        		
	        	scope.tabPartialPath = partialsPath+'entity/';
	        	
	        	scope.getEntity = function(){
	        		if(scope.entityID === 'null'){
	        			scope.entity = $slatwall['new'+propertyCasedEntityName]();
	        			setupMetaData();
	        		}else{
	        			var entityPromise = $slatwall['get'+propertyCasedEntityName]({id:scope.entityID});
	        			entityPromise.promise.then(function(){
	        				scope.entity = entityPromise.value;
	        				setupMetaData();
	        			});
	        		}
	        		
	        	};
	        	scope.getEntity();
	        	scope.deleteEntity = function(){
	        		var deletePromise = scope.entity.$$delete();
	        		deletePromise.then(function(){
	        			$location.path( '/entity/'+propertyCasedEntityName+'/' );
	        		});
	        	};
	        	scope.allTabsOpen = false;
	        }
	    };
	}
]);