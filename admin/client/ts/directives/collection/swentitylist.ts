'use strict';

angular.module('slatwalladmin').directive('swEntityList', [
	'$http','$compile','$log','collectionPartialsPath','paginationService','$slatwall',
	
	function($http,$compile,$log,collectionPartialsPath,paginationService,$slatwall){
		return {
			restrict: 'E',
			scope:{
				entities: "=",
				properties: "=",
				debug:"@"
			},
			transclude: true,
			controller: function($scope, $element){
				this.maxDepth = 1; //<-- this is the default depth.
				
				/** debug msg */
				this.debug = function(msg, optional){
					if (arguments.length > 1 && $scope.debug == "on"){
						console.log(msg, optional);
					}else if (arguments.length == 1 && $scope.debug == "on"){
						console.log(msg);
					}	
				};
				this.depth = 0; //<--this is the root depth.
				this.getDepth = function(){
					return this.depth;
				}
				this.increaseDepth = function(){
					this.depth++;
				}
				this.decreaseDepth = function(){
					this.depth--;
				}
				
				this.getEntities = function(){
					return $scope.entities; 
				};
				this.getEntity = function(name){
					return $scope[name];
				}
				this.addEntity = function(name, data){
					if (angular.isDefined(name) && angular.isDefined(data)){
						console.log("Adding data for", name, data);
						$scope[name] = data;	
					}
				}
				this.removeEntity = function(entity){
					var i = this.entities.indexOf(entity);
					if (i !== -1){
						$scope.entities.splice(i, 1);	
					}
				};
				this.updateAll = function(){
					for (var e in $scope.entities){
						$scope.entities[e].update();
					}
				};
				this.deleteAll = function(){
					for (var e in $scope.entities){
						$scope.entities[e].pop();
					}
				}
				 
				this.debug("Entities: ", this.getEntities());
				
			},
			controllerAs: "parent",
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
			link: function(scope, element, attrs){
				
			} 
		};
	}
]);
	