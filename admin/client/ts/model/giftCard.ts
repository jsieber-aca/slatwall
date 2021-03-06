/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
module slatwalladmin {
    'use strict';

    export class GiftCard {
        constructor(
            public giftCardID: string,
            public giftCardCode: string, 
            public giftCardPin: string, 
            public expirationDate: string, 
            public ownerFirstName: string, 
            public ownerLastName: string, 
            public ownerEmailAddress: string, 
            public activeFlag: boolean
        ) { 
 
        }
    }
}