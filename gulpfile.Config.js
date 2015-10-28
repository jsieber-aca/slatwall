'use strict';
var GulpConfig = (function () {
    function GulpConfig() {
        this.source = './admin/client/ts/';
        
        this.ngSlatwallcfm = './api/views/js/ngslatwall.cfm';
        
        this.entityPath = './model/entity/*.cfc';
        this.processPath = './model/process/*.cfc';
        
        this.tsOutputPath = './admin/client' + '/js/es6';
        this.tsOutputPathto5 = './admin/client' + '/js/es5';
        this.allJavaScript = ['./admin/client' + '/js/**/*.js'];
        this.allTypeScript = this.source+ '/**/*.ts';
       
        this.ngSlatwallTypescript = './client/ts/modules/*.ts';
        this.ngSlatwallOutputPath = './client/js/es6';
		
        this.typings = './client/typings/';
        this.libraryTypeScriptDefinitions = './client/typings/**/*.ts';
        this.appTypeScriptReferences = this.typings + 'slatwallTypescript.d.ts';
        
        this.compilePath = 'admin/client/js/';
        this.es6Path = './admin/client/js/es6/**/*.js';
        this.es5Path = './admin/client/js/es5/**/*.js';
        this.modelPath = './model/entity/**/*.cfc';
        
        //this.es5Path = 'admin/client/js/es5/**/*.js',
        //this.propertiesPath = 'config/resourceBundles/*.properties',
        
        //angular builder info
        this.angularbuilderconfig = {
        	seed: [
		        "./index.html.ejs"
		    ],
		    options: {
		        parseExclude: [
		            "/libs/",
		            /\/libs-optional\/[^\/]+\/includes\//i
		        ],
		        requiredFiles: [],
		        requiredLibs: [
		            "/libs/"
		        ],
		        filePriority: [
		            "/libs/jquery/jquery.js",
		            "/libs/lodash/lodash.js",
		            "/libs/angular/angular.js",
		            "/libs/jquery/",
		            "/libs/lodash/",
		            "/libs/angular/"
		        ],
		        optionalLibs: [
		            "/libs-optional/"
		        ],
		        optionalLibsInclude: [
		            /\/libs-optional\/[^\/]+\/includes\/[^\/]+\.js/i
		        ],
		        globalDependencies: [
		            "Restangular"
		        ],
		        appModule: "myAngularApp",
		        globalModules: [
		            "ngAnimate",
		            "ui.router",
		            "ui.bootstrap",
		            "restangular"
		        ],
		        verbose: true,
		        debug: false
		    }
		};
    }
    return GulpConfig;
})();
module.exports = GulpConfig;

var config = (function(){
	
	
});