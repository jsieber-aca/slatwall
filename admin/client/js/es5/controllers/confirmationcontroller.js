var hibachi;
(function (hibachi) {
    var controllers;
    (function (controllers) {
        'use strict';
        hibachi.getModule().controller("confirmationController", ["$scope", "$log", "$modalInstance", function ($scope, $log, $modalInstance) {
                $scope.deleteEntity = function (entity) {
                    $log.debug("Deleting an entity.");
                    $log.debug($scope.entity);
                    this.close();
                };
                /**
                 * Closes the modal window
                 */
                $scope.close = function () {
                    $modalInstance.close();
                };
                /**
                 * Cancels the modal window
                 */
                $scope.cancel = function () {
                    $modalInstance.dismiss("cancel");
                };
            }]);
    })(controllers = hibachi.controllers || (hibachi.controllers = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../controllers/confirmationcontroller.js.map