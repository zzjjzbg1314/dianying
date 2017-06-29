<link rel="stylesheet" href="/roctools/static/css/angular-material.min.css"/>
<style>
    .MychipsStyle .custom-chips .md-chip {
        position: relative;
        padding-right: 35px;
    }

    .MychipsStyle .custom-chips .md-chip .md-chip-remove-container {
        position: absolute;
        right: 4px;
        top: 4px;
        margin-right: 0;
        height: 24px;
    }

    .MychipsStyle .custom-chips .md-chip .md-chip-remove-container button.employeeChip {
        position: relative;
        height: 24px;
        width: 24px;
        line-height: 30px;
        text-align: center;
        background: rgba(0, 0, 0, 0.3);
        border-radius: 50%;
        border: none;
        box-shadow: none;
        padding: 0;
        margin: 0;
        transition: background 0.15s linear;
        display: block;
    }

    .MychipsStyle .custom-chips .md-chip .md-chip-remove-container button.employeeChip md-icon {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate3d(-50%, -50%, 0) scale(0.7);
        color: white;
        fill: white;
    }

    .MychipsStyle .custom-chips .md-chip .md-chip-remove-container button.employeeChip:hover, .MychipsStyle .custom-chips .md-chip .md-chip-remove-container button.employeeChip:focus {
        background: rgba(255, 0, 0, 0.8);
    }
    md-list-item.md-3-line, md-list-item.md-3-line>.md-no-style{
        min-height: 0;
    }
</style>

<div ng-app="App" ng-controller="MainCtrl" style="margin-top: -20px;position: relative;">
    <md-toolbar class="md-accent">
        <md-progress-linear md-mode="indeterminate" ng-show="processing"></md-progress-linear>
        <div class="md-toolbar-tools">
            <h3>
                <span>选择战区:</span>
            </h3>
            <md-select placeholder="BU" ng-model="selectedBU" style="margin-left: 2em;" class="md-body-2">
                <md-option ng-repeat="bu in BUList" value="{{bu.id}}" ng-click="getTerritoryNodes(bu.id);"
                           ng-bind="bu.territoryName">
                </md-option>
            </md-select>
            <md-select placeholder="战区" ng-model="selectedNode" style="margin-left: 2em;" class="md-body-2">
                <md-option ng-repeat="territory in territoryNodes" value="{{territory.id}}" ng-click="getTerritoryMgrs(territory.id);"
                           ng-bind="territory.territoryName">
                </md-option>
            </md-select>
        </div>
    </md-toolbar>
    <md-content>
        <md-list style="height: 90vh;">
            <md-list-item class="md-3-line" ng-repeat="territory in territoryList">
                <div class="md-list-item-text MychipsStyle" layout="row" layout-align="start center"
                     style=" padding:0;">
                    <div style="width: 15em;"ng-bind="territory.territoryName" flex="20"></div>
                    <div flex="80">
                        <md-chips class="custom-chips" ng-model="territory.terriMgrDtos"
                                  placeholder="输入工号添加"
                                  delete-button-label="删除"
                                  delete-hint="点按进行删除"
                                  secondary-placeholder="输入工号添加"
                                  md-on-append="addEmployee($chip,territory.territoryId)">

                            <md-chip-template>
                            <span>
                               <strong ng-bind="$chip.employeeName"></strong>
                                <md-tooltip ng-if="!isDialogShowing && $chip.employeeNo">
                                    <span ng-bind="'工号:'+$chip.employeeNo"></span>
                                </md-tooltip>
                            </span>
                            </md-chip-template>
                            <button md-chip-remove class="md-primary employeeChip"
                                    ng-click="deleteEmployee($chip, $event,territory.territoryId);">
                                <md-icon md-svg-icon="md-close" id="{{$chip.id}}"></md-icon>
                                <md-tooltip>
                                    <span ng-bind="'删除'"></span>
                                </md-tooltip>
                            </button>
                        </md-chips>
                    </div>

                </div>
            </md-list-item>
        </md-list>
    </md-content>
</div>
<script src="/roctools/static/js/jquery.min.js"></script>
<script src="/roctools/static/js/angular.min.js"></script>
<script src="/roctools/static/js/angular-resource.min.js"></script>
<script src="/roctools/static/js/angular-aria.min.js"></script>
<script src="/roctools/static/js/angular-animate.min.js"></script>
<script src="/roctools/static/js/angular-material.min.js"></script>
<script>
    angular.module('App', ['ngMaterial', 'ngResource'])
            .config(function ($mdThemingProvider) {
                $mdThemingProvider.theme('default')
                        .primaryPalette('blue-grey')
                        .accentPalette('grey');
            })
            .controller('MainCtrl', function ($scope,
                                              BuFactory,
                                              TerritoryFactory,
                                              $mdDialog,
                                              $timeout,
                                              delTerritoryFactory,
                                              $http,
                                              mToast) {
                $scope.processing = true;
                $scope.territoryNodes = [];
                $scope.territoryList = [];
                $scope.BUList = [];

                var tempId = -10000,
                        isDelClicked = false,
                        isDataLoadEvent = false;
                $scope.isDialogShowing = false;
                (function () {
                    $scope.processing = true;
                    BuFactory().query()
                            .$promise
                            .then(function (rs) {
                                if (rs.length > 0) {
                                    $scope.BUList = rs;
                                    $scope.selectedBU = rs[0].id;
                                    $scope.getTerritoryNodes($scope.selectedBU);
                                }else{
                                    $scope.processing = false;
                                }
                            });
                })();

                $scope.getTerritoryNodes = function(id){
                    $scope.processing = true;
                    BuFactory(id).query()
                            .$promise
                            .then(function (rs) {
                                if (rs.length > 0) {
                                    $scope.territoryNodes = rs;
                                    $scope.selectedNode = rs[0].id;
                                    $scope.getTerritoryMgrs(rs[0].id)
                                }else{
                                    $scope.processing = false;
                                }

                            });
                };

                function deleteFromList(list, territoryId, id) {
                    for (var index = 0; index < list.length; index++) {
                        if (list[index].territoryId === territoryId) {
                            for (var i = 0; i < list[index].terriMgrDtos.length; i++) {
                                if (list[index].terriMgrDtos[i].id === id) {
                                    list[index].terriMgrDtos.splice(i, 1);
                                    break;
                                }
                            }
                            break;
                        }
                    }
                }
                var addZero =  function (employeeNo) {

                    function factorial(result) {
                        if (result.length >= 7) {
                            employeeNo = result;
                            return false;
                        }
                        if (result.length <7) {
                            result = '0' + result;
                        }
                        return factorial(result);
                    }

                    factorial(employeeNo);
                    return employeeNo;
                };
                function addToList(list, territoryId, id, newEmployee,rollback) {
                    for (var index = 0; index < list.length; index++) {
                        if (list[index].territoryId === territoryId) {
                            if (list[index].terriMgrDtos.length === 0 || rollback) {
                                list[index].terriMgrDtos.push(newEmployee);
                                return;
                            }
                            for (var i = 0; i < list[index].terriMgrDtos.length; i++) {
                                if (list[index].terriMgrDtos[i].id === id) {
                                    list[index].terriMgrDtos[i].id = newEmployee.id;
                                    list[index].terriMgrDtos[i].employeeName = newEmployee.name;
                                    break;
                                }
                            }
                            break;
                        }
                    }
                }

                function genConfirmDlg(employee, $event) {
                    return $mdDialog.confirm()
                            .title('确定删除' + employee.employeeName + '吗?')
                            .content('工号:' + employee.employeeNo)
                            .ok('删除')
                            .cancel('取消')
                            .targetEvent($event);
                }

                $scope.deleteEmployee = function (employee, $event, territoryId, rollback) {
                    if ($scope.processing) {
                        return;
                    }

                    var confirm = genConfirmDlg(employee, $event);

                    if ($event) {
                        isDelClicked = true;
                        $event.stopImmediatePropagation();
                    }

                    $scope.isDialogShowing = true;
                    $mdDialog.show(confirm).then(function () {

                        (function () {
                            $scope.processing = true;
                            delTerritoryFactory.get({id: employee.id})
                                    .$promise.then(function (rs) {
                                        if (rs.code === 200) {
                                            deleteFromList($scope.territoryList, territoryId, employee.id);
                                            mToast('删除成功！');
                                        }
                                        $scope.processing = false;
                                        $scope.isDialogShowing = false;
                                    });
                        })();
                    }, function () {
                        if (rollback) {
                            addToList($scope.territoryList, territoryId, employee.id, employee,rollback)
                        }
                        $scope.isDialogShowing = false;
                        isDelClicked = false;
                    });

                };
                $scope.addEmployee = function (employeeNo, territoryId) {
                    $scope.processing = true;
                    var id = 'id' + tempId++;
                    $http.post('/roctools/saveTerriMgr?territoryId=' + territoryId + '&employeeNo=' + employeeNo)
                            .success(function (data) {
                                if (data.code !== 200) {
                                    mToast(data.msg);
                                    isDataLoadEvent = true;
                                    deleteFromList($scope.territoryList, territoryId, id)
                                } else {
                                    var newEmployee = JSON.parse(data.msg);
                                    isDataLoadEvent = true;
                                    addToList($scope.territoryList, territoryId, id, newEmployee);
                                }
                                $scope.processing = false;
                            }).error(function () {
                                isDataLoadEvent = true;
                                deleteFromList($scope.territoryList, territoryId, id);
                                $scope.processing = false;
                            });
                    if(employeeNo)
                        employeeNo = addZero(employeeNo);
                    return {
                        id: id,
                        employeeName: '...',
                        employeeNo: employeeNo,
                        territoryId: territoryId
                    }
                };
                $scope.getTerritoryMgrs = function (id) {
                    $scope.processing = true;
                    isDataLoadEvent = true;
                    TerritoryFactory.query({territoryId: id}, {})
                            .$promise
                            .then(function (rs) {
                                $scope.territoryList = rs;
                                $scope.processing = false;
                            });
                };
                $scope.$watch('territoryList', function (newValue, oldValue) {
                    if($scope.processing){
                        return;
                    }
                    if (isDataLoadEvent || isDelClicked || $scope.isDialogShowing) {
                        isDataLoadEvent = false;
                        isDelClicked = false;
                        $scope.isDialogShowing = false;
                        return;
                    }

                    var newList = angular.copy(newValue);
                    var oldList = angular.copy(oldValue);
                    var employee = {};
                    for (var index = 0; index < newList.length; index++) {
                        if (newList[index].terriMgrDtos.length < oldList[index].terriMgrDtos.length) {
                            if (oldList[index].terriMgrDtos.length === 0)
                                return;
                            if (newList[index].terriMgrDtos.length === 0) {
                                employee = oldList[index].terriMgrDtos[0];
                            }
                            for (var i = 0; i < oldList[index].terriMgrDtos.length; i++) {
                                if (newList[index].terriMgrDtos[i] === undefined ||
                                        newList[index].terriMgrDtos[i].id !== oldList[index].terriMgrDtos[i].id) {
                                    employee = oldList[index].terriMgrDtos[i];
                                    break;
                                }
                            }
                            break;
                        }
                    }
                    if (employee.territoryId) {
                        $scope.deleteEmployee(employee, null, employee.territoryId, true)
                    }

                }, true)
            })
            .factory('mToast', function ($mdToast) {
                return function (text) {
                    $mdToast.show(
                            $mdToast.simple()
                                    .content(text)
                                    .position('top right')
                                    .hideDelay(2000)
                    );
                };
            })
            .factory('BuFactory', function ($resource) {
                return function (id) {
                    id = id || 1;
                   return $resource('/roctools/queryBUs/' + id)
                };
            }).factory('TerritoryFactory', function ($resource) {
                return $resource('/roctools/queryTerritoryMgrs');
            }).factory('delTerritoryFactory', function ($resource) {
                return $resource('/roctools/deleteTerritoryMgr');
            });
</script>