/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
var hibachi;
(function (hibachi) {
    var model;
    (function (model) {
        //model
        class Alert {
            constructor(msg, type) {
                this.msg = msg;
                this.type = type;
            }
        }
        model.Alert = Alert;
    })(model = hibachi.model || (hibachi.model = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../model/alert.js.map