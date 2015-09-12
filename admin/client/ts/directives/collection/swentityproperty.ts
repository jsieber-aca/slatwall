angular.module('slatwalladmin')
.directive('swEntityProperty', [
'$log',
'partialsPath',
	function(
	$log,
	partialsPath
	){
		return {
			require:'^swEntity',
			restrict: 'E',
			scope:{
				property:"@",
				editable:"=",
				editing:"=",
				isHidden:"=",
				title:"=",
				hint:"=",
				optionsArguments:"=",
				eagerLoadOptions:"=",
				isDirty:"=",
				onChange:"=",
				fieldType:"@",
				noValidate:"="
					
			},
			templateUrl:partialsPath+"propertydisplay.html",
			link: function(scope, element, attrs, parentController){
				//get the parent node
				console.log(element, attrs);
				var parentNode = element.target.parentNode;
				var parentEntityType = parentNode.attribute.name;
				
				//if the item is new, then all fields at the object level are dirty
				$log.debug('editing property');
				$log.debug(scope.property);
				$log.debug(scope.title);
				
				/**
				 * Configuration for property display object.
				 */
				scope.propertyDisplay = {
					object:scope.object,
					property:scope.property,
					errors:{},
					editing:scope.editing,
					editable:scope.editable,
					isHidden:scope.isHidden,
					fieldType:scope.fieldType || scope.object.metaData.$$getPropertyFieldType(scope.property),
					title: scope.title,
					hint:scope.hint || scope.object.metaData.$$getPropertyHint(scope.property),
					optionsArguments:scope.optionsArguments || {},
					eagerLoadOptions:scope.eagerLoadOptions || true,
					isDirty:scope.isDirty,
					onChange:scope.onChange,
					noValidate:scope.noValidate
				};
				if(angular.isUndefined(scope.propertyDisplay.noValidate)){
					scope.propertyDisplay.noValidate = false;
				}
				if(angular.isUndefined(scope.propertyDisplay.editable)){
					scope.propertyDisplay.editable = true;
				}
				if(angular.isUndefined(scope.editing)){
					scope.propertyDisplay.editing = false;
				}
				if(angular.isUndefined(scope.propertyDisplay.isHidden)){
					scope.propertyDisplay.isHidden = false;
				}
				
				scope.$id = 'propertyDisplay:'+scope.property;
				
				scope.propertyDisplay.form = parentController;
				
				$log.debug(scope.propertyDisplay);
				$log.debug('propertyDisplay');
				$log.debug(scope.propertyDisplay);
			}
		};
	}
]);
	
