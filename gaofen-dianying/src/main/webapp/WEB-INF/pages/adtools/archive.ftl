<link rel="stylesheet" href="/roctools/static/css/angular-material.min.css"/>
<link rel="stylesheet" href="/roctools/static/css/ivh-treeview.min.css"/>
<script src="/roctools/static/js/angular.min.js"></script>
<style>

    .mTabs md-content {
        background-color: transparent !important;
    }

    .mTabs md-content md-tabs {
        background: #f6f6f6;
        border: 1px solid #e1e1e1;
    }

    .pagination .repeated-item {
        border-right: 1px solid #ddd;
        box-sizing: border-box;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        text-align: center;
        width: 30px;
        cursor: pointer;
    }

    .pagination .selected-item {
        background-color: rgb(244, 67, 54);
    }

    .pagination md-content {
        margin: 2px;
    }

    #horizontal-container {
        height: 45px;
    }

    .m-list-text {
        text-align: center;
    }

    .m-list-text a {
        cursor: pointer;
    }

    .md-subheader .md-subheader-inner {
        padding: 0;
    }

    .mTree ul {
        list-style: none;
    }
</style>
<div ng-app="Archive" ng-controller="ArchiveCtrl" class="mTabs" style="position: relative;">
    <md-content>
        <md-tabs md-dynamic-height md-border-bottom class="md-primary" md-selected="selectedIndex">
            <md-tab label="按小组查询" ng-click="resetPagination(selectedIndex)">
                <md-content class="md-padding">
                    <div layout="row" layout-align="center center">
                        <md-input-container flex="40">
                            <label>小组</label>
                            <input ng-model="selectedInputText" ng-click="setShowTree(true)">
                        </md-input-container>
                        <div layout="row" layout-align="center center">
                            <label style="padding: 10px;color: slategray">审批通过时间:</label>
                            <md-input-container>
                                <label>年份</label>
                                <md-select ng-model="selectedYear" aria-label="审批通过月">
                                    <md-option ng-value="year" ng-repeat="year in years" ng-bind="year"></md-option>
                                </md-select>
                            </md-input-container>
                            <md-input-container ng-init="monthNames = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]">
                                <label>月份</label>
                                <md-select ng-model="selectedMonth" aria-label="审批通过月">
                                    <md-option ng-value="month" ng-repeat="month in monthNames"
                                               ng-bind="month"></md-option>
                                </md-select>
                            </md-input-container>
                        </div>
                        <md-input-container>
                            <label ng-bind="'归档状态'"></label>
                            <md-select ng-model="selectedStatus">
                                <md-option value="" ng-bind="'全&nbsp;&nbsp;&nbsp;&nbsp;部'"></md-option>
                                <md-option value="1" ng-bind="'已归档'"></md-option>
                                <md-option value="0" ng-bind="'未归档'"></md-option>
                            </md-select>
                        </md-input-container>
                        <md-button class="md-raised md-primary" ng-click="searchByDepartments(0);"
                                   ng-bind="'搜索'" aria-label="搜索"></md-button>
                    </div>
                </md-content>
            </md-tab>
            <md-tab label="按合同号查询" ng-click="setShowTree(false)">
                <md-content class="md-padding">
                    <div layout="row" layout-align="center center" aria-hidden="true">
                        <md-input-container flex="40">
                            <label>合同号</label>
                            <input ng-model="contractno" type="text">
                        </md-input-container>
                        <md-button class="md-raised md-primary" ng-click="searchByContractNo(contractno);"
                                   ng-bind="'查找'" aria-label="查找"></md-button>
                    </div>
                </md-content>
            </md-tab>
            <md-tab label="按签约销售查询" ng-click="resetPagination(selectedIndex);setShowTree(false);">
                <md-content class="md-padding">
                    <div layout="row" layout-align="center center" aria-hidden="true">
                        <md-input-container flex="40">
                            <label>工号</label>
                            <input ng-model="SalesNo" type="text">
                        </md-input-container>
                        <md-button class="md-raised md-primary" ng-click="searchByCreateBy(SalesNo,0);" ng-bind="'查找'"
                                   aria-label="查找"></md-button>
                    </div>
                </md-content>
            </md-tab>

        </md-tabs>

        <div layout="column" layout-fill>
            <md-toolbar class="md-accent">
                <div class="md-toolbar-tools">
                    <md-button class="md-raised md-primary" ng-click="doArchive(selected,1)" ng-show="pageModel.records"
                               ng-bind="'合同归档'" aria-label="合同归档"></md-button>
                    <span style="font-size: 0.75em;" ng-bind="'已选:'+ selected.length" ng-show="selected.length"></span>
                    <span flex></span>

                    <div class="pagination" layout="row" style="font-size: 0.75em;" ng-show="selectedIndex !== 1">
                        <span flex></span>

                        <div ng-show="pageIndex" style="line-height: 30px;margin-right: 0.5em;"
                             ng-bind="'第' + pageIndex + '页'"></div>

                        <md-virtual-repeat-container id="horizontal-container" md-orient-horizontal
                                                     ng-show="mPages.length>1"
                                                     ng-style="{'width':mPages.length>10 ? '300px' : mPages.length*30+'px'}">
                            <div ng-repeat="item in mPages" ng-bind="item" ng-click="goToPage(selectedIndex,item)"
                                 class="repeated-item {{pageIndex === item ? 'selected-item':''}}" flex>
                            </div>

                        </md-virtual-repeat-container>

                        <div ng-show="mPages.length" style="line-height: 30px;margin-left: 0.5em;"
                             ng-bind="'共' + mPages.length + '页'"></div>
                    </div>
                </div>
            </md-toolbar>
            <md-content style="height: 90vh">
                <md-subheader class="md-primary" layout="column">
                    <div style="height: 44px;" class="md-list-item-text" layout="row" layout-align="start center"
                         ng-init="columnsTexts = [
                         ['合同ID','contractID'],
                         ['合同号','contractNo'],
                         ['审批状态','approveStatus'],
                         ['客户名','customerName'],
                         ['签约销售','salesName'],
                         ['销售团队','departmentName'],
                         ['协议创建时间','createdTime']
                         ]">
                        <div layout="row" layout-align="start center" style="height: 88px;">
                            <div style="min-width: 44px;min-height: 42px">
                                <md-checkbox class="md-warn"
                                             ng-checked="unArchive.length && allExists(unArchive, selected)"
                                             ng-click="toggleAll(unArchive, selected)" aria-label="全选">
                                </md-checkbox>
                            </div>
                            <div layout="row" layout-align="center center">
                                <a style="cursor: pointer;" ng-bind="'归档状态'" ng-click="setOrderBy('archiveStatus')"></a>
                                <div layout="row" ng-show="mOrderName === 'archiveStatus'">
                                    <md-icon ng-show="mOrder==='+'" style="cursor: pointer;" md-svg-src="/roctools/static/image/ic_arrow_drop_up_18px.svg"  aria-label="."></md-icon>
                                    <md-icon ng-show="mOrder==='-'" style="cursor: pointer;" md-svg-src="/roctools/static/image/ic_arrow_drop_down_18px.svg"  aria-label="."></md-icon>
                                </div>
                            </div>
                        </div>

                        <div layout="row" layout-align="center center" flex class="m-list-text" ng-repeat="text in columnsTexts">
                            <a ng-bind="text[0]" ng-click="setOrderBy(text[1])"></a>
                            <div layout="row" ng-show="mOrderName === text[1]">
                                <md-icon ng-show="mOrder==='+'" style="cursor: pointer;" md-svg-src="/roctools/static/image/ic_arrow_drop_up_18px.svg"  aria-label="."></md-icon>
                                <md-icon ng-show="mOrder==='-'" style="cursor: pointer;" md-svg-src="/roctools/static/image/ic_arrow_drop_down_18px.svg"  aria-label="."></md-icon>
                            </div>
                        </div>
                        <div flex class="m-list-text" ng-bind="'撤销归档'"></div>
                    </div>
                </md-subheader>
                <md-list>
                    <div layout="row" class="md-3-line" ng-repeat="contract in pageModel.records | orderBy:mOrderBy"
                         style="border-bottom: 1px solid rgba(0,0,0,0.12);">
                        <div layout="row" layout-align="start center" style="height: 88px;">
                            <div style="min-width: 44px;min-height: 42px">
                                <md-checkbox class="md-warn" ng-checked="exists(contract, selected)"
                                             ng-click="toggle(contract, selected);$event.stopPropagation();"
                                             aria-label="是否选中"
                                             ng-show="contract.archiveStatus === 0">
                                </md-checkbox>
                            </div>
                            <div ng-bind="contract.archiveStatus ?  '已归档' : '未归档'"></div>
                        </div>
                        <div class="md-list-item-text" layout="row" layout-align="center center"
                             ng-bind="contract.contractID"
                             flex></div>
                        <div class="md-list-item-text" layout="row" layout-align="center center"
                             ng-bind="contract.contractNo"
                             flex></div>
                        <div class="md-list-item-text" layout="row" layout-align="center center" flex>
                            <span ng-if="contract.approveStatus === 1" ng-bind="'提交'"></span>
                            <span ng-if="contract.approveStatus === 2" ng-bind="'未通过'"></span>
                            <span ng-if="contract.approveStatus === 3" ng-bind="'通过'"></span>
                            <span ng-if="contract.approveStatus === 4" ng-bind="'驳回'"></span>
                        </div>
                        <div class="md-list-item-text" ng-bind="contract.customerName" layout="row"
                             layout-align="center center"
                             flex></div>
                        <div class="md-list-item-text" ng-bind="contract.salesName" layout="row"
                             layout-align="center center"
                             flex></div>
                        <div class="md-list-item-text" ng-bind="contract.departmentName" layout="row"
                             layout-align="center center"
                             flex></div>
                        <div class="md-list-item-text" ng-bind="contract.createdTime | date:'yyyy-MM-dd HH:mm:ss' " layout="row"
                             layout-align="center center"
                             flex></div>
                        <div class="md-list-item-text" layout="row" layout-align="center center" flex>
                            <md-button ng-if="contract.archiveStatus === 1" class="md-raised md-warn"
                                       ng-click="showConfirm($event,contract);"
                                       ng-bind="'撤销归档'" aria-label="撤销归档"></md-button>
                        </div>
                    </div>
                </md-list>
            </md-content>

        </div>

    </md-content>

    <md-card ng-init="showTree = false;" layout="column" ng-show="showTree" draggable
             style="z-index: 999;top: 180px;left: 200px;background-color: white;">
        <md-toolbar>
            <div class="md-toolbar-tools" style="cursor: move;">
                <span flex></span>
                <md-button class="md-icon-button" ng-click="setShowTree(false)">
                    <md-icon md-svg-src="/roctools/static/image/ic_close_24px.svg" aria-label="关闭"></md-icon>
                </md-button>
            </div>
        </md-toolbar>
        <div layout="row" ng-show="departments">
            <md-input-container md-no-float style="padding-bottom: 2px;" flex>
                <input ng-model="mFilter" type="text" placeholder="过滤">
            </md-input-container>
            <md-icon style="cursor: pointer;margin-right: 2em;"
                     md-svg-src="/roctools/static/image/ic_backspace_24px.svg"
                     aria-label="删除" ng-click="mFilter=''" ng-show="mFilter"></md-icon>
        </div>

        <md-card-content layout="column" layout-align="start start" style="min-width: 250px;min-height: 250px;">
            <div ivh-treeview="departments"
                 ivh-treeview-id-attribute="'id'"
                 ivh-treeview-label-attribute="'text'"
                 ivh-treeview-children-attribute="'children'"
                 ivh-treeview-selected-attribute="'isSelected'"
                 ivh-treeview-on-cb-change="treeSelectCallback(ivhNode, ivhIsSelected, ivhTree)"
                 ivh-treeview-on-toggle="awesomeCallback(ivhNode, ivhIsExpanded, ivhTree)"
                 ivh-treeview-filter="mFilter"
                 style="max-height: 50vh;overflow-y: scroll;min-width: 250px;"
                 class="mTree"
                 layout-padding
                 ng-show="!renderingTree">
            </div>
            <div layout="row" layout-align="space-around" style="width: 100%;" ng-show="renderingTree">
                <md-progress-circular md-mode="indeterminate"></md-progress-circular>
            </div>
        </md-card-content>
        <div class="md-actions" layout="row" layout-align="end center" ng-show="departments">
            <md-button ng-click="collapseRec()">
                合拢
            </md-button>
            <md-button ng-click="expandRec()" style="margin-right:20px;">
                展开
            </md-button>
        </div>
    </md-card>

    <div layout="column" layout-align="center center"
         style="position: absolute;left: 0;top: 0;bottom: 0;right: 0;background-color: transparent !important;"
         ng-show="processing">
        <md-progress-circular md-mode="indeterminate"></md-progress-circular>
    </div>
</div>
<script src="/roctools/static/js/angular-resource.min.js"></script>
<script src="/roctools/static/js/angular-aria.min.js"></script>
<script src="/roctools/static/js/angular-animate.min.js"></script>
<script src="/roctools/static/js/angular-material.min.js"></script>
<script src="/roctools/static/js/ivh-treeview.min.js"></script>
<script src="/roctools/static/js/jquery.min.js"></script>
<script>
    angular.module('Archive', ['ngMaterial', 'ngResource', 'ivh.treeview'])
            .config(function ($mdThemingProvider, ivhTreeviewOptionsProvider) {
                $mdThemingProvider.theme('default')
                        .primaryPalette('teal')
                        .accentPalette('grey');
                ivhTreeviewOptionsProvider.set({
                    defaultSelectedState: false,
                    validate: true,
                    twistieExpandedTpl: '<md-icon style="cursor: pointer;width: 1em;height: 1em;" md-svg-src="/roctools/static/image/ic_remove_circle_24px.svg"  aria-label="."></md-icon>',
                    twistieCollapsedTpl: '<md-icon style="cursor: pointer;width: 1em;height: 1em;" md-svg-src="/roctools/static/image/ic_add_circle_24px.svg"  aria-label="."></md-icon>',
                    twistieLeafTpl: ''
                });
            }).factory('TreeFactory', function ($resource) {
                return $resource('/roctools/combotree');
            }).factory('ArchiveFactory', function ($resource) {
                return $resource('/roctools/archivestatus');
            }).factory('ArchiveBySalesFactory', function ($resource) {
                return $resource('/roctools/contractByCreateBy');
            }).factory('ArchiveByNoFactory', function ($resource) {
                return $resource('/roctools/contractno');
            }).factory('ArchiveSingleFactory', function ($resource) {
                return $resource('/roctools/archiverecord');
            }).factory('ArchiveMultiplesFactory', function ($resource) {
                return $resource('/roctools/archiverecords');
            }).directive('draggable', ['$document', function ($document) {
                return {
                    restrict: 'A',
                    link: function (scope, elm, attrs) {
                        var startX, startY, initialMouseX, initialMouseY;
                        elm.css({position: 'absolute'});

                        elm.bind('mousedown', function ($event) {
                            startX = elm.prop('offsetLeft');
                            startY = elm.prop('offsetTop');
                            initialMouseX = $event.clientX;
                            initialMouseY = $event.clientY;
                            $document.bind('mousemove', mousemove);
                            $document.bind('mouseup', mouseup);
                            return false;
                        });

                        function mousemove($event) {
                            var dx = $event.clientX - initialMouseX;
                            var dy = $event.clientY - initialMouseY;
                            elm.css({
                                top: startY + dy + 'px',
                                left: startX + dx + 'px'
                            });
                            return false;
                        }

                        function mouseup() {
                            $document.unbind('mousemove', mousemove);
                            $document.unbind('mouseup', mouseup);
                        }
                    }
                };
            }]).factory('mToast', function ($mdToast) {
                return function (text) {
                    $mdToast.show(
                            $mdToast.simple()
                                    .content(text)
                                    .position('top right')
                                    .hideDelay(2000)
                    );
                };
            }).controller('ArchiveCtrl', function ($scope, $mdDialog,
                                                   TreeFactory, ArchiveFactory, ArchiveByNoFactory, ArchiveBySalesFactory, ArchiveSingleFactory, ArchiveMultiplesFactory,
                                                   mToast, ivhTreeviewMgr) {


                $scope.selectedInputText = '';
                var selectedIds = '';
                $scope.treeSelectCallback = function (node, isSelected, tree) {
                    var text = '';
                    selectedIds = '';
                    tree.forEach(function (childTree) {
                        var list = convertTreeToList(childTree);
                        for (var i = 0; i < list.length; i++) {
                            (i === list.length - 1)
                                    ? (text += list[i].text, selectedIds += list[i].id)
                                    : ( text += list[i].text + ',', selectedIds += list[i].id + ',')
                        }
                    });
                    $scope.selectedInputText = text;
                };

                $scope.expandRec = function () {
                    ivhTreeviewMgr.expandRecursive($scope.departments, $scope.departments);
                };

                $scope.collapseRec = function () {
                    ivhTreeviewMgr.collapseRecursive($scope.departments, $scope.departments);
                };

                function convertTreeToList(root) {
                    var stack = [], array = [], hashMap = {};
                    stack.push(root);

                    while (stack.length !== 0) {
                        var node = stack.pop();
                        if (node.children === null) {
                            visitNode(node, hashMap, array);
                        } else {
                            for (var i = node.children.length - 1; i >= 0; i--) {
                                stack.push(node.children[i]);
                            }
                        }
                    }

                    return array;
                }

                function visitNode(node, hashMap, array) {
                    if (!hashMap[node.id]) {
                        hashMap[node.id] = true;
                        if (node.isSelected) {
                            array.push(node);
                        }
                    }
                }

                $scope.showTree = false;
                $scope.setShowTree = function (showTree) {
                    if ($scope.showTree === showTree) {
                        return;
                    }
                    $scope.showTree = showTree;
                    if (showTree && !$scope.departments) {
                        $scope.renderingTree = true;
                        TreeFactory.get()
                                .$promise
                                .then(function (rs) {
                                    if (rs.code === 200) {
                                        $scope.departments = rs.msg;
                                        $scope.renderingTree = false;
                                    }

                                }, function () {
                                    $scope.renderingTree = false;

                                });
                    }
                };

                $scope.selectedStatus = "";
                $scope.years = [];
                var date = new Date();
                $scope.selectedMonth = date.getMonth() + 1;
                var currentYear = date.getFullYear();
                $scope.selectedYear = currentYear;
                for (var y = currentYear; y >= 2000; y--) {
                    $scope.years.push(y);
                }

                function setUnArchive() {
                    $scope.unArchive = [];
                    $scope.selected = [];
                    for (var j = 0; j < $scope.pageModel.records.length; j++) {
                        if (!$scope.pageModel.records[j].archiveStatus) {
                            $scope.unArchive.push($scope.pageModel.records[j]);
                        }
                    }
                }

                function setPagination(pageModel){
                    var mPages = [];
                    if(pageModel.recordCount>0) {
                        $scope.pageIndex = pageModel.page;
                        for (var i = 0; i < pageModel.pageCount; i++) {
                            mPages.push(i + 1);
                        }
                        $scope.mPages = mPages;
                    }else{
                        $scope.pageIndex = 0;
                        $scope.mPages = [];
                    }
                }

                $scope.pageIndex = 0;
                $scope.mPages = [];
                $scope.searchByDepartments = function (pageIndex) {
                    if ($scope.pageIndex === pageIndex && pageIndex != 0) {
                        return;
                    }
                    if (!selectedIds) {
                        mToast("请选择小组");
                        return;
                    }
                    $scope.processing = true;
                    var month = $scope.selectedYear + '-' + ($scope.selectedMonth < 10 ? ("0" + $scope.selectedMonth) : $scope.selectedMonth);
                    ArchiveFactory.get({
                        month: month,
                        departments: selectedIds,
                        archivestatus: $scope.selectedStatus,
                        page: pageIndex || 1,
                        pageSize: 20
                    }).$promise.then(function (rs) {
                                if (rs.code === 200) {
                                    $scope.pageModel = rs.msg;
                                    setPagination($scope.pageModel);
                                    setUnArchive();
                                }
                                $scope.processing = false;
                            }, function () {
                                mToast("网络错误");
                                $scope.processing = false;
                            });
                };


                $scope.searchByContractNo = function (ContractNo) {
                    if (!ContractNo) {
                        mToast("合同号不能为空");
                        return;
                    }
                    $scope.processing = true;
                    ArchiveByNoFactory.get({
                        contractno: ContractNo
                    })
                            .$promise
                            .then(function (rs) {
                                if (rs.code === 200) {
                                    $scope.pageModel = rs.msg;
                                    setPagination($scope.pageModel);
                                    setUnArchive();
                                }
                                $scope.processing = false;
                            }, function () {
                                mToast("网络错误");
                                $scope.processing = false;
                            });
                };
                $scope.searchByCreateBy = function (CreateBy, pageIndex) {
                    if (($scope.pageIndex === pageIndex && pageIndex != 0)) {
                        return;
                    }
                    if (!CreateBy) {
                        mToast("工号不能为空");
                        return;
                    }
                    $scope.processing = true;
                    ArchiveBySalesFactory.get({
                        createBy: CreateBy,
                        page: pageIndex || 1,
                        pageSize: 20
                    })
                            .$promise
                            .then(function (rs) {
                                if (rs.code === 200) {
                                    $scope.pageModel = rs.msg;
                                    setPagination($scope.pageModel);
                                    setUnArchive();
                                }
                                $scope.processing = false;
                            }, function () {
                                mToast("网络错误");
                                $scope.processing = false;
                            });
                };

                $scope.selected = [];
                $scope.unArchive = [];
                $scope.toggle = function (item, list) {
                    var idx = list.indexOf(item);
                    if (idx > -1) list.splice(idx, 1);
                    else list.push(item);
                };
                $scope.toggleAll = function (items, selectedItems) {
                    $scope.selected = [];
                    if (items.length !== selectedItems.length) {
                        items.forEach(function (item) {
                            $scope.selected.push(item);
                        });
                    }
                };
                $scope.allExists = function (items, list) {
                    return items && items.length === list.length;
                };
                $scope.exists = function (item, list) {
                    return list.indexOf(item) > -1;
                };

                $scope.resetPagination = function (index) {
                    $scope.pageIndex = 0;
                    $scope.mPages = [];
                    $scope.selected = [];
                };

                $scope.goToPage = function (type, pageIndex) {
                    if (type === 0) {
                        $scope.searchByDepartments(pageIndex);
                        return;
                    }

                    if (type === 2) {
                        $scope.searchByCreateBy($scope.SalesNo, pageIndex)
                    }
                };

                $scope.doArchive = function (selectedContracts, archiveStatus) {
                    if (!selectedContracts && archiveStatus === 0) {
                        return;
                    }
                    if (!selectedContracts.length && archiveStatus === 1) {
                        mToast("还没有选择合同!");
                        return;
                    }
                    $scope.processing = true;
                    var factory, params, ids = [];
                    if (selectedContracts.length > 1) {
                        factory = ArchiveMultiplesFactory;
                        var contractIds = '';
                        for (var i = 0; i < selectedContracts.length; i++) {
                            i === (selectedContracts.length - 1) ? contractIds += selectedContracts[i].contractID : contractIds += selectedContracts[i].contractID + ',';
                            ids.push(selectedContracts[i].contractID);
                        }
                        params = {contractId: contractIds, archiveStatus: archiveStatus};
                    } else {
                        factory = ArchiveSingleFactory;
                        if (Object.prototype.toString.call(selectedContracts) === '[object Array]') {
                            params = {contractId: selectedContracts[0].contractID, archiveStatus: archiveStatus};
                            ids.push(selectedContracts[0].contractID);
                        } else {
                            params = {contractId: selectedContracts.contractID, archiveStatus: archiveStatus};
                            ids.push(selectedContracts.contractID);
                        }

                    }
                    factory.get(params)
                            .$promise
                            .then(function (rs) {
                                if (rs.code === 200) {
                                    mToast(archiveStatus === 0 ? '撤销成功' : '归档成功');
                                    for (var i = 0; i < $scope.pageModel.records.length; i++) {
                                        for (var j = 0; j < ids.length; j++) {
                                            if ($scope.pageModel.records[i].contractID === ids[j]) {
                                                $scope.pageModel.records[i].archiveStatus = archiveStatus;
                                                ids.splice(j, 1);
                                            }
                                        }
                                    }
                                }
                                $scope.processing = false;
                                setUnArchive();
                            }, function () {
                                mToast(archiveStatus === 0 ? '撤销失败' : '归档失败');
                                $scope.processing = false;
                            });
                };

                $scope.showConfirm = function (ev, contract) {
                    var confirm = $mdDialog.confirm()
                            .title('确定撤销归档?')
                            .content('合同号:' + contract.contractNo)
                            .ariaLabel('撤销归档')
                            .targetEvent(ev)
                            .ok('确定')
                            .cancel('取消');
                    $mdDialog.show(confirm).then(function () {
                        $scope.doArchive(contract, 0);
                    }, function () {
                        //
                    });
                };

                $scope.mOrderBy = '+contractNo';
                $scope.mOrderName = 'contractNo';
                $scope.mOrder = '+';
                $scope.setOrderBy = function (orderBy) {
                    if(!orderBy){
                        return
                    }
                    $scope.mOrderName = orderBy;
                    if ($scope.mOrderBy.substr(1) === orderBy) {
                        var i = $scope.mOrderBy.charAt(0);
                        i === '+' ? i = '-' : i = '+';
                        $scope.mOrderBy = i + orderBy;
                        $scope.mOrder = i;
                    }else{
                        var j = $scope.mOrderBy.charAt(0);
                        $scope.mOrderBy = j + orderBy;
                        $scope.mOrder = j;
                    }
                }
            }
    );
</script>