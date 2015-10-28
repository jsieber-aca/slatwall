var hibachi;
(function (hibachi) {
    var controllers;
    (function (controllers) {
        'use strict';
        angular.module('slatwalladmin').controller('pageDialog', [
            '$scope',
            '$location',
            '$log',
            '$anchorScroll',
            '$slatwall',
            'dialogService',
            function ($scope, $location, $log, $anchorScroll, $slatwall, dialogService) {
                $scope.$id = 'pageDialogController';
                //get url param to retrieve collection listing
                $scope.pageDialogs = dialogService.getPageDialogs();
                $scope.scrollToTopOfDialog = function () {
                    $location.hash('/#topOfPageDialog');
                    $anchorScroll();
                };
                $scope.pageDialogStyle = { "z-index": 3000 };
            }
        ]);
    })(controllers = hibachi.controllers || (hibachi.controllers = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../controllers/pagedialog.js.map