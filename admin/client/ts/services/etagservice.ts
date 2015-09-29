/// <reference path='../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../client/typings/tsd.d.ts' />

/*services return promises which can be handled uniquely based on success or failure by the controller*/
module slatwalladmin{
    //service
    
    export class ETagService implements IETagService{
        public static $inject = [
            '$window'
        ];
        
        constructor(
            $window
        ) {
            this.$window = $window
            if(!this.$window.localStorage.getItem('ETags')){
                this.$window.localStorage.setItem('ETags',JSON.stringify({}));
            }
        }
        public getETags = ()=>{
            return JSON.parse(this.$window.localStorage.getItem('ETags'));    
        }
        public setETag = (url,value)=>{
            var ETags = this.getETags();
            ETags[url] = value;
            this.$window.localStorage.setItem('ETags',JSON.stringify(ETags));
        }
        public getETag = (url)=>{
            return this.getETags()[url];    
        }
        
    }  
    angular.module('slatwalladmin')
    .service('eTagService',ETagService); 
}
    
