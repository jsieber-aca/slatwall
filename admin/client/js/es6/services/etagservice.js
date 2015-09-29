/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
/*services return promises which can be handled uniquely based on success or failure by the controller*/
var slatwalladmin;
(function (slatwalladmin) {
    //service
    class ETagService {
        constructor($window) {
            this.getETags = () => {
                return JSON.parse(this.$window.localStorage.getItem('ETags'));
            };
            this.setETag = (url, value) => {
                var ETags = this.getETags();
                ETags[url] = value;
                this.$window.localStorage.setItem('ETags', JSON.stringify(ETags));
            };
            this.getETag = (url) => {
                return this.getETags()[url];
            };
            this.$window = $window;
            if (!this.$window.localStorage.getItem('ETags')) {
                this.$window.localStorage.setItem('ETags', JSON.stringify({}));
            }
        }
    }
    ETagService.$inject = [
        '$window'
    ];
    slatwalladmin.ETagService = ETagService;
    angular.module('slatwalladmin')
        .service('eTagService', ETagService);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../services/etagservice.js.map