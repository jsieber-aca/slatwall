'use strict';

angular.module('slatwalladmin').directive('swEntity', [
	'$http','$compile','$log','collectionPartialsPath','paginationService','$slatwall',
	
	function($http, $compile, $log, collectionPartialsPath, paginationService, $slatwall){
		return {
			require: '^?swEntityList',
			restrict: 'E',
			scope:{
				entity:"@",
				properties:"=",
				depth:"@",
				isRegistered:"@",
				id:"@",
				debug:"@",
				template:"@",
				filter:"=",
				collectionFilter:"="
			},
			transclude: false, 
			controller: "entityCtrl",
			controllerAs:"ctrl",
			link: function(scope, element, attrs, parentCtrl){
				console.log(scope);
				/**Pushes debug messages to the console if debug is enabled (for frontend guys);
				 */
				var debug = function(msg, optional){
					if (arguments.length > 1 && scope.debug == "on"){
						console.log(msg, optional);
					}else if (arguments.length == 1 && scope.debug == "on"){
						console.log(msg);
					}	
				};
				
				debug("Entity Type:", scope.entity);
				
				/**Sets the config properties.
				 */
				var collectionConfig = new slatwalladmin.CollectionConfig($slatwall, scope.entity);
				
				if (angular.isDefined(scope.properties)){
					for (var property in scope.properties){
						debug("setting property on entity", scope.properties[property]);
						collectionConfig.setDisplayProperties(scope.properties[property]);
					}	
				}else{
					collectionConfig.useDefaultColumns(true);
				}
				
				/**Set an ID
				 */
				if (angular.isDefined(scope.id) && scope.id.length == 32){
					debug("ID set to =>", scope.id);
					collectionConfig.setId(scope.id);
				}
				
				/** finds a filter */
				if (angular.isDefined(scope.filter)){
					debug("Adding filter", {});
					collectionConfig.addFilter(scope.filter.propertyIdentifier,
  											   scope.filter.value,
  											   scope.filter.comparisonOperator,
  											   scope.filter.logicalOperator);
				}
				/** finds collection filters and adds to the config */
				if (angular.isDefined(scope.collectionFilter)){
					debug("Adding collection filter", {});
					collectionConfig.addFilter(scope.filter.propertyIdentifier,
										       scope.filter.displayPropertyIdentifier,
											   scope.filter.collectionID,
											   scope.filter.criteria,
  											   scope.filter.fieldType,
  											   scope.filter.readOnly);
				}
				
				scope.collectionConfig = collectionConfig.getCollectionConfig();
				
				debug("Collection Config:", scope.collectionConfig);
				var entityPromise = collectionConfig.getEntity();
				
				entityPromise.then(function(data){
					debug("Entity data:", data); 
					if (angular.isDefined(data.pageRecords)){
						parentCtrl.addEntity(scope.entity, data.pageRecords);
						
						
					}else{
						parentCtrl.addEntity(scope.entity, data);
						
						
					}
				});
			} 
		};
	}
]);
	