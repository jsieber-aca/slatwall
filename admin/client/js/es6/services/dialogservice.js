/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />
var hibachi;
(function (hibachi) {
    var services;
    (function (services) {
        class DialogService extends hibachi.services.BaseService {
            constructor(partialsPath) {
                super();
                this.partialsPath = partialsPath;
                this.get = () => {
                    return this._pageDialogs || [];
                };
                this.addPageDialog = (name, params) => {
                    var newDialog = {
                        'path': this.partialsPath + name + '.html',
                        'params': params
                    };
                    this._pageDialogs.push(newDialog);
                };
                this.removePageDialog = (index) => {
                    this._pageDialogs.splice(index, 1);
                };
                this.getPageDialogs = () => {
                    return this._pageDialogs;
                };
                this.removeCurrentDialog = () => {
                    this._pageDialogs.splice(this._pageDialogs.length - 1, 1);
                };
                this.getCurrentDialog = () => {
                    return this._pageDialogs[this._pageDialogs.length - 1];
                };
                this._pageDialogs = [];
            }
        }
        DialogService.$inject = [
            'partialsPath'
        ];
        services.DialogService = DialogService;
        hibachi.getModule().service('dialogService', DialogService);
    })(services = hibachi.services || (hibachi.services = {}));
})(hibachi || (hibachi = {}));

//# sourceMappingURL=../services/dialogservice.js.map