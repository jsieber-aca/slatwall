/// <reference path="../../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../../client/typings/slatwallTypeScript.d.ts" />
var slatwalladmin;
(function (slatwalladmin) {
    'use strict';
    var SWGiftCardDetailController = (function () {
        function SWGiftCardDetailController(collectionConfigService) {
            var _this = this;
            this.collectionConfigService = collectionConfigService;
            this.init = function () {
                var giftCardConfig = _this.collectionConfigService.newCollectionConfig('GiftCard');
                giftCardConfig.setDisplayProperties("giftCardID, giftCardCode, currencyCode, giftCardPin, expirationDate, ownerFirstName, ownerLastName, ownerEmailAddress, activeFlag, balanceAmount,  originalOrderItem.sku.product.productName, originalOrderItem.sku.product.productID, originalOrderItem.order.orderID, originalOrderItem.orderItemID, orderItemGiftRecipient.firstName, orderItemGiftRecipient.lastName, orderItemGiftRecipient.emailAddress, orderItemGiftRecipient.giftMessage");
                giftCardConfig.addFilter('giftCardID', _this.giftCardId);
                giftCardConfig.setAllRecords(true);
                giftCardConfig.getEntity().then(function (response) {
                    _this.giftCard = response.records[0];
                });
            };
            this.init();
        }
        SWGiftCardDetailController.$inject = ["collectionConfigService"];
        return SWGiftCardDetailController;
    })();
    slatwalladmin.SWGiftCardDetailController = SWGiftCardDetailController;
    var GiftCardDetail = (function () {
        function GiftCardDetail(collectionConfigService, partialsPath) {
            this.collectionConfigService = collectionConfigService;
            this.partialsPath = partialsPath;
            this.scope = {};
            this.bindToController = {
                giftCardId: "@",
                giftCard: "=?"
            };
            this.controller = SWGiftCardDetailController;
            this.controllerAs = "swGiftCardDetail";
            this.link = function (scope, element, attrs) {
            };
            this.templateUrl = partialsPath + "/entity/giftcard/basic.html";
            this.restrict = "E";
        }
        GiftCardDetail.$inject = ["collectionConfigService", "partialsPath"];
        return GiftCardDetail;
    })();
    slatwalladmin.GiftCardDetail = GiftCardDetail;
    angular.module('slatwalladmin')
        .directive('swGiftCardDetail', ["collectionConfigService", "partialsPath",
        function (collectionConfigService, partialsPath) {
            return new GiftCardDetail(collectionConfigService, partialsPath);
        }
    ]);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=swgiftcarddetail.js.map
