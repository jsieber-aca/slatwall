'use strict';

angular.module('slatwalladmin').directive('swEntity', [
	'$http','$compile','$log','collectionPartialsPath','paginationService','$slatwall',
	
	function($http, $compile, $log, collectionPartialsPath, paginationService, $slatwall){
		return {
			require: '^swEntityList',
			restrict: 'E',
			scope:{
				entity: "@",
				properties: "=",
				depth:"@",
				isRegistered:"@",
				id:"@",
				debug:"@",
				template:"@"
			},
			transclude: false,
			controller: function($scope, $element){
					
			},
			controllerAs:"entity",
			link: function(scope, element, attrs, parentCtrl){
				/**Sets the gathered data into scope.
				 */
				 
				scope.setEntityData = function(name, data){
					if (angular.isDefined(name) && angular.isDefined(data)){
						debug("adding data in child for: " + name, data);
						scope[name] = data;
					}
				};
				/**Pushes debug messages to the console if debug is enabled (for frontend guys);
				 */
				var debug = function(msg, optional){
					if (arguments.length > 1 && scope.debug == "on"){
						console.log(msg, optional);
					}else if (arguments.length == 1 && scope.debug == "on"){
						console.log(msg);
					}	
				};
				/**Sets a variable on parent scope that contains all of our data can be accessed.
				 */
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
				
				scope.collectionConfig = collectionConfig.getCollectionConfig();
				
				debug("Collection Config:", scope.collectionConfig);
				var entityPromise = collectionConfig.getEntity();
				
				entityPromise.then(function(data){
					debug("Entity data:", data); 
					if (angular.isDefined(data.pageRecords)){
						parentCtrl.addEntity(scope.entity, data.pageRecords);
						console.log("Parent Controller Data: ", parentCtrl);
					}else{
						parentCtrl.addEntity(scope.entity, data);
						console.log("Parent Controller Data: ", parentCtrl);
					}
				});
			} 
		};
	}
]);
	