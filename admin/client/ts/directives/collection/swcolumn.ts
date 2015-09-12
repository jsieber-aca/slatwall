'use strict';

angular.module('slatwalladmin').directive('swColumn', [
	'$http','$compile','$log','collectionPartialsPath','paginationService','$slatwall',
	
	function($http, $compile, $log, collectionPartialsPath, paginationService, $slatwall){
		return {
			require: '^swEntity',
			restrict: 'E',
			scope:{
				entity: "=",
				property:"=",
				options:"="
			},
			link: function(scope, element, attrs, parentCtrl){
				
				console.log("Entity Type: ", scope.entity);
				var collectionConfig = new slatwalladmin.CollectionConfig($slatwall, scope.entity);
				var properties = scope.properties;
				
				for (var property in properties){
					console.log("setting property on entity", properties[property]);
					collectionConfig.setDisplayProperties(properties[property]);
				}
				
				console.log("Collection Config:", collectionConfig.getCollectionConfig());
				
			} 
		};
	}
]);
	