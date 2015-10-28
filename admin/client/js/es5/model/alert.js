/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
var hibachi;
(function (hibachi) {
    var model;
    (function (model) {
        //model
        var Alert = (function () {
            function Alert(msg, type) {
                this.msg = msg;
                this.type = type;
            }
            return Alert;
        })();
        model.Alert = Alert;
    })(model = hibachi.model || (hibachi.model = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../model/alert.js.map