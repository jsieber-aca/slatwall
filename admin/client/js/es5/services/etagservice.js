/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
/*services return promises which can be handled uniquely based on success or failure by the controller*/
var slatwalladmin;
(function (slatwalladmin) {
    //service
    var ETagService = (function () {
        function ETagService($window) {
            var _this = this;
            this.getETags = function () {
                return JSON.parse(_this.$window.localStorage.getItem('ETags'));
            };
            this.setETag = function (url, value) {
                var ETags = _this.getETags();
                ETags[url] = value;
                _this.$window.localStorage.setItem('ETags', JSON.stringify(ETags));
            };
            this.getETag = function (url) {
                return _this.getETags()[url];
            };
            this.$window = $window;
            if (!this.$window.localStorage.getItem('ETags')) {
                this.$window.localStorage.setItem('ETags', JSON.stringify({}));
            }
        }
        ETagService.$inject = [
            '$window'
        ];
        return ETagService;
    })();
    slatwalladmin.ETagService = ETagService;
    angular.module('slatwalladmin')
        .service('eTagService', ETagService);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../services/etagservice.js.map