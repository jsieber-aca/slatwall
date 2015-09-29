/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
/*services return promises which can be handled uniquely based on success or failure by the controller*/
var slatwalladmin;
(function (slatwalladmin) {
    //service
    class ETagService {
        constructor() {
            this.setETag = (url, value) => {
                this._etags[url] = value;
            };
            this.getETag = (url) => {
                return this._etags[url];
            };
            this._etags = {};
        }
    }
    ETagService.$inject = [];
    slatwalladmin.ETagService = ETagService;
    angular.module('slatwalladmin')
        .service('eTagService', ETagService);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../services/etagservice.js.map