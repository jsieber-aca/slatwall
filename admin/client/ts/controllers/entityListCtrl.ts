'use strict';
angular.module('slatwalladmin')
    .controller('entityListCtrl', [
        '$scope', '$log', '$timeout', '$slatwall',
        'metadataService', 'paginationService', 'observerService',
        function ($scope, $element, $log, $timeout, $slatwall, metadataService, paginationService, observerService) {
            $scope.entities = [];
            /** debug msg */
            this.debug = function(msg, optional){
                if (arguments.length > 1 && $scope.debug == "on"){
                    console.log(msg, optional);
                }else if (arguments.length == 1 && $scope.debug == "on"){
                    console.log(msg);
                }	
            }; 
            
            this.getEntities = function(){
                return $scope.entities; 
            };
            
            this.getEntity = function(name){
                if ( angular.isObject($scope.entities[name]) ){
                        console.log("Entity: ",$scope.entities[name]);
                        return $scope.entities[name];
                }
            }
            
            this.addEntity = function(name, data){
                console.log("Data Length", data.length);
                if (angular.isDefined(name) && angular.isDefined(data)){
                    if (angular.isArray(data) && angular.isDefined(data.length) && data.length > 1){
                        console.log("Adding data for records: ", name, data);
                        $scope.Collection[name + "s"] = data;	
                        var entity = {};
                        entity[name+"s"] = data;
                        $scope.entities.push(entity);
                    }
                    else if(angular.isArray(data) && angular.isDefined(data.length) && data.length == 1){
                        console.log("Adding data for records: ", name, data);
                        $scope.Collection[name] = data[0];	
                        var entity = {};
                        entity[name] = data[0];
                        $scope.entities.push(entity);
                    }
                    else if(angular.isUndefined(data.length)){
                        console.log("Adding data for record: ", name, data);
                        $scope.Collection[name] = data;
                        var entity = {};
                        entity[name] = data;
                        $scope.entities.push(entity);
                    }
                    
                }
            }
            this.removeEntity = function(entity){
                var i = this.entities.indexOf(entity);
                if (i !== -1){
                    $scope.entities.splice(i, 1);	
                }
            };
            
            this.updateAll = function(){
                for (var e in $scope.entities){
                    $scope.entities[e].update();
                }
            };
            
            this.deleteAll = function(){
                for (var e in $scope.entities){
                    $scope.entities[e].pop();
                }
            }
                
            this.debug("Entities: ", this.getEntities());

        }
    ]);
