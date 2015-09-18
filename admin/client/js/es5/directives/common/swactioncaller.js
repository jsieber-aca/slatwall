/// <reference path='../../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../../client/typings/tsd.d.ts' />
var slatwalladmin;
(function (slatwalladmin) {
    'use strict';
    var SWActionCallerController = (function () {
        function SWActionCallerController(partialsPath, utilityService, $slatwall) {
            var _this = this;
            this.partialsPath = partialsPath;
            this.utilityService = utilityService;
            this.$slatwall = $slatwall;
            this.init = function () {
                //			this.class = this.utilityService.replaceAll(this.utilityService.replaceAll(this.getAction(),':',''),'.','') + ' ' + this.class;
                //			this.type = this.type || 'link';
                //			this.actionItem = this.getActionItem();
                //			this.actionItemEntityName = this.getActionItemEntityName();
                //			this.text = this.getText();
                //			if(this.getDisabled()){
                //				this.getDisabledText();
                //			}else if(this.getConfirm()){
                //				this.getConfirmText();
                //			}
                //			
                //			if(this.modalFullWidth && !this.getDisabled()){
                //				this.class = this.class + " modalload-fullwidth";
                //			}
                //			
                //			if(this.modal && !this.getDisabled() && !this.modalFullWidth){
                //				this.class = this.class + " modalload";
                //			}
                /*need authentication lookup by api to disable
                <cfif not attributes.hibachiScope.authenticateAction(action=attributes.action)>
                    <cfset attributes.class &= " disabled" />
                </cfif>
                */
                console.log(_this);
            };
            this.getAction = function () {
                return _this.action || '';
            };
            this.getActionItem = function () {
                return _this.utilityService.listLast(_this.getAction(), '.');
            };
            this.getActionItemEntityName = function () {
                var firstFourLetters = _this.utilityService.left(_this.actionItem, 4);
                var firstSixLetters = _this.utilityService.left(_this.actionItem, 6);
                var minus4letters = _this.utilityService.right(_this.actionItem, 4);
                var minus6letters = _this.utilityService.right(_this.actionItem, 6);
                var actionItemEntityName = "";
                if (firstFourLetters === 'list' && _this.actionItem.length > 4) {
                    actionItemEntityName = minus4letters;
                }
                else if (firstFourLetters === 'edit' && _this.actionItem.length > 4) {
                    actionItemEntityName = minus4letters;
                }
                else if (firstFourLetters === 'save' && _this.actionItem.length > 4) {
                    actionItemEntityName = minus4letters;
                }
                else if (firstSixLetters === 'create' && _this.actionItem.length > 6) {
                    actionItemEntityName = minus6letters;
                }
                else if (firstSixLetters === 'detail' && _this.actionItem.length > 6) {
                    actionItemEntityName = minus6letters;
                }
                else if (firstSixLetters === 'delete' && _this.actionItem.length > 6) {
                    actionItemEntityName = minus6letters;
                }
                return actionItemEntityName;
            };
            this.getTitle = function () {
                //if title is undefined then use text
                if (angular.isUndefined(_this.title) || !_this.title.length) {
                    _this.title = _this.getText();
                }
                return _this.title;
            };
            this.getTextByRBKeyByAction = function (actionItemType, plural) {
                if (plural === void 0) { plural = false; }
                var navRBKey = _this.$slatwall.getRBKey('admin.define.' + actionItemType + '_nav');
                var entityRBKey = '';
                var replaceKey = '';
                if (plural) {
                    entityRBKey = _this.$slatwall.getRBKey('entity.' + _this.actionItemEntityName + '_plural');
                    replaceKey = '${itemEntityNamePlural}';
                }
                else {
                    entityRBKey = _this.$slatwall.getRBKey('entity.' + _this.actionItemEntityName);
                    replaceKey = '${itemEntityName}';
                }
                return _this.utilityService.replaceAll(navRBKey, replaceKey, entityRBKey);
            };
            this.getText = function () {
                //if we don't have text then make it up based on rbkeys
                if (angular.isUndefined(_this.text) || (angular.isDefined(_this.text) && !_this.text.length)) {
                    _this.text = _this.$slatwall.getRBKey(_this.utilityService.replaceAll(_this.getAction(), ":", ".") + '_nav');
                    var minus8letters = _this.utilityService.right(_this.text, 8);
                    //if rbkey is still missing. then can we infer it
                    if (minus8letters === '_missing') {
                        var firstFourLetters = _this.utilityService.left(_this.actionItem, 4);
                        var firstSixLetters = _this.utilityService.left(_this.actionItem, 6);
                        var minus4letters = _this.utilityService.right(_this.actionItem, 4);
                        var minus6letters = _this.utilityService.right(_this.actionItem, 6);
                        if (firstFourLetters === 'list' && _this.actionItem.length > 4) {
                            _this.text = _this.getTextByRBKeyByAction('list', true);
                        }
                        else if (firstFourLetters === 'edit' && _this.actionItem.length > 4) {
                            _this.text = _this.getTextByRBKeyByAction('edit', false);
                        }
                        else if (firstFourLetters === 'save' && _this.actionItem.length > 4) {
                            _this.text = _this.getTextByRBKeyByAction('save', false);
                        }
                        else if (firstSixLetters === 'create' && _this.actionItem.length > 6) {
                            _this.text = _this.getTextByRBKeyByAction('create', false);
                        }
                        else if (firstSixLetters === 'detail' && _this.actionItem.length > 6) {
                            _this.text = _this.getTextByRBKeyByAction('detail', false);
                        }
                        else if (firstSixLetters === 'delete' && _this.actionItem.length > 6) {
                            _this.text = _this.getTextByRBKeyByAction('delete', false);
                        }
                    }
                    if (_this.utilityService.right(_this.text, 8)) {
                        _this.text = _this.$slatwall.getRBKey(_this.utilityService.replaceAll(_this.getAction(), ":", "."));
                    }
                }
                if (!_this.title || (_this.title && !_this.title.length)) {
                    _this.title = _this.text;
                }
                return _this.text;
            };
            this.getDisabled = function () {
                //if item is disabled
                if (angular.isDefined(_this.disabled) && _this.disabled) {
                    return true;
                }
                else {
                    return false;
                }
            };
            this.getDisabledText = function () {
                if (_this.getDisabled()) {
                    //and no disabled text specified
                    if (angular.isUndefined(_this.disabledtext) || !_this.disabledtext.length) {
                        var disabledrbkey = _this.utilityService.replaceAll(_this.action, ':', '.') + '_disabled';
                        _this.disabledtext = $slatwall.getRBKey(disabledrbkey);
                    }
                    //add disabled class
                    _this.class += " s-btn-disabled";
                    _this.confirm = false;
                    return _this.disabledtext;
                }
                return "";
            };
            this.getConfirm = function () {
                if (angular.isDefined(_this.confirm) && _this.confirm) {
                    return true;
                }
                else {
                    return false;
                }
            };
            this.getConfirmText = function () {
                if (_this.getConfirm()) {
                    if (angular.isUndefined(_this.confirmtext) && _this.confirmtext.length) {
                        var confirmrbkey = _this.utilityService.replaceAll(_this.action, ':', '.') + '_confirm';
                        _this.confirmtext = $slatwall.getRBKey(confirmrbkey);
                    }
                    _this.class += " alert-confirm";
                    return _this.confirm;
                }
                return "";
            };
            console.log('actioncaller');
            this.$slatwall = $slatwall;
            this.utilityService = utilityService;
            //need to perform init after promise completes
            this.init();
        }
        return SWActionCallerController;
    })();
    slatwalladmin.SWActionCallerController = SWActionCallerController;
    var SWActionCaller = (function () {
        function SWActionCaller(partialsPath, utiltiyService, $slatwall) {
            this.partialsPath = partialsPath;
            this.utiltiyService = utiltiyService;
            this.$slatwall = $slatwall;
            this.restrict = 'EA';
            this.bindToController = {
                action: "@",
                text: "@",
                type: "@",
                queryString: "@",
                title: "@",
                class: "@",
                icon: "@",
                iconOnly: "=",
                name: "@",
                confirm: "=",
                confirmtext: "@",
                disabled: "=",
                disabledtext: "@",
                modal: "=",
                modalFullWidth: "=",
                id: "@"
            };
            this.controller = SWActionCallerController;
            this.controllerAs = "swActionCaller";
            this.link = function (scope, element, attrs) {
                console.log('scope');
                console.log(scope);
            };
            this.templateUrl = partialsPath + 'actioncaller.html';
        }
        return SWActionCaller;
    })();
    slatwalladmin.SWActionCaller = SWActionCaller;
    angular.module('slatwalladmin').directive('swActionCaller', ['partialsPath', 'utilityService', '$slatwall', function (partialsPath, utilityService, $slatwall) { return new SWActionCaller(partialsPath, utilityService, $slatwall); }]);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../../directives/common/swactioncaller.js.map