'use strict';
//Thanks to AdamMettro
angular.module('slatwalladmin')
    .directive('swClickOutside', ['$document', '$timeout',
    function ($document, $timeout) {
        return {
            restrict: 'A',
            scope: {
                swClickOutside: '&'
            },
            link: function ($scope, elem, attr) {
                var classList = (attr.outsideIfNot !== undefined) ? attr.outsideIfNot.replace(', ', ',').split(',') : [];
                if (attr.id !== undefined)
                    classList.push(attr.id);
                $document.on('click', function (e) {
                    var i = 0, element;
                    if (!e.target)
                        return;
                    for (element = e.target; element; element = element.parentNode) {
                        var id = element.id;
                        var classNames = element.className;
                        if (id !== undefined) {
                            for (i = 0; i < classList.length; i++) {
                                if (id.indexOf(classList[i]) > -1 || classNames.indexOf(classList[i]) > -1) {
                                    return;
                                }
                            }
                        }
                    }
                    $timeout(function () {
                        $scope.swClickOutside();
                    });
                });
            }
        };
    }]);

//# sourceMappingURL=swclickoutside.js.map
