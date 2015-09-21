'use strict';

angular.module('slatwalladmin').directive('swEntityList', [
	'$http','$compile','$log','collectionPartialsPath','paginationService','$slatwall',
	
	function($http,$compile,$log,collectionPartialsPath,paginationService,$slatwall){
		return {
			restrict: 'E',
			bindToController:{
				entities: "=",
				properties: "=",
				debug: "@",
				index: "="
			},
			transclude: true,
			controller: "entityListCtrl",
			controllerAs: "Collection",
			template: function getTemplate(tElement, tAttributes){
				var hasChildren = false;
				if (tElement.find('swEntity')){
					hasChildren = true;
				}
				if (hasChildren){
					return "<div ng-transclude></div>";
				}else{
					return "<sw:entity ng-repeat='entity in entities track by $index' entity='entity' properties='properties[$index]' debug='on'></sw:entity>";
				}
			}, 
			link: function(scope, element, attrs, ctrl, transclude){
				
			} 
		};
	}
]);
	