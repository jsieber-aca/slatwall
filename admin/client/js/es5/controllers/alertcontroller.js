var hibachi;
(function (hibachi) {
    var controllers;
    (function (controllers) {
        'use strict';
        hibachi.getModule().controller('alertController', [
            '$scope',
            'alertService',
            function ($scope, alertService) {
                $scope.$id = "alertController";
                $scope.alerts = alertService.getAlerts();
            }
        ]);
    })(controllers = hibachi.controllers || (hibachi.controllers = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../controllers/alertcontroller.js.map