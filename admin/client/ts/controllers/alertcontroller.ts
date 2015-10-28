module hibachi.controllers{
    'use strict';
    getModule().controller('alertController', [
    	'$scope',
    	'alertService',
    	function(
    		$scope,
    		alertService
    	){
    		$scope.$id="alertController";
    		$scope.alerts = alertService.getAlerts();
    	}
    ]);
}