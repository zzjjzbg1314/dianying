<link rel="stylesheet" href="/roctools/static/components/angular-material/angular-material.min.css"/>
<link rel="stylesheet" href="/roctools/static/components/angular-material-data-table/md-data-table.min.css"/>

<script src="/roctools/static/js/jquery.min.js"></script>
<style>
    .fix-margin {
        margin-top: -20px;
        margin-left: -10px;
        position: relative;
    }
</style>
<style>
    @font-face {
        font-family: 'Material Icons';
        font-style: normal;
        font-weight: 400;
        src: local('Material Icons'), local('MaterialIcons-Regular'), url(/roctools/static/fonts/icon-fonts.woff2) format('woff2');
    }

    .material-icons {
        font-family: 'Material Icons';
        font-weight: normal;
        font-style: normal;
        font-size: 24px;
        line-height: 1;
        letter-spacing: normal;
        text-transform: none;
        display: block;
        white-space: nowrap;
        word-wrap: normal;
        direction: ltr;
        -webkit-font-feature-settings: 'liga';
        -webkit-font-smoothing: antialiased;
        color: rgba(117, 117, 117, 1)
    }

    .md-default {
        background-color: #fff;
        color: rgba(0, 0, 0, .87);
    }

    .md-table-toolbar {
        box-shadow: none;
    }

    md-toolbar.md-table-toolbar form > input {
        width: 100%;
        margin: 0;
        border: none;
        color: rgba(0, 0, 0, 0.87);
    }

    .input_box {
        border: 0 none white;
        background: none;
    }

    .input_box:focus {
        border: 0;
        outline: none;
    }

    .mToolbar {
        background-color: rgba(250, 250, 250, 1) !important;
    }

    .mToolbar md-icon {
        color: rgba(0, 0, 0, 0.54) !important;
    }

    .mTabs {

    }

    .btn-wrapper {
        position: absolute;
        top: 8px;
        right: 0;
        padding-right: 20px;
    }

    .btn-wrapper .md-icon-button {
        margin: 0;
    }

    .table-toolbar {
        font-size: 1.6rem !important;
    }

    .table-toolbar .md-select-icon {
        margin: 0;
    }

    .m-list-content #vertical-container {
        height: 100vh !important;
        width: 100%;
    }

    .m-list-content .repeated-item {
        border-bottom: 1px solid rgba(0, 0, 0, .12);
        box-sizing: border-box;
        min-height: 55px;
        padding-left: 16px;
        padding-right: 16px;
    }

    .m-list-content .m-header {
        padding-left: 16px;
        padding-right: 16px;
        height: 56px;
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .2), 0 1px 1px 0 rgba(0, 0, 0, .14), 0 2px 1px -1px rgba(0, 0, 0, .12);
    }

    .m-list-content .m-header div {
        padding: 0 !important;
        text-align: center;
        width: 100%;
        color: rgba(0, 0, 0, .54);
        font-size: 12px;
        font-weight: 700;
        white-space: nowrap;
        min-width: 56px;
    }

    .m-list-content .repeated-item div {
        font-size: 13px;
        padding: 0 !important;
        color: rgba(0, 0, 0, .87);
        text-align: center;
        width: 100%;
        min-width: 56px;

    }

    .m-list-content md-content {
        margin: 16px;
    }

</style>

<script src="/roctools/static/components/angular/angular.min.js"></script>
<script src="/roctools/static/components/angular-resource/angular-resource.min.js"></script>
<script src="/roctools/static/components/angular-aria/angular-aria.min.js"></script>
<script src="/roctools/static/components/angular-animate/angular-animate.min.js"></script>
<script src="/roctools/static/components/angular-material/angular-material.min.js"></script>
<script src="/roctools/static/components/angular-material-data-table/md-data-table.min.js"></script>

<div ng-app="ShopLabelTool" ng-controller="ShopLabelToolCtrl as ctrl" class="fix-margin" ng-cloak id="shopLabelTool"
     style="min-height: 100vh">

    <md-content class="mTabs" style="padding: 8px 8px 0 8px;">
        <md-tabs md-dynamic-height md-border-bottom>
            <md-tab ng-repeat="item in configs.labelConfig" label="{{item.name}}">
                <md-content flex>
                    <md-button class="md-raised {{label.operation =='delete' ? ' md-warn' : ''}}"
                               ng-repeat="label in item.labels" ng-click="setLabel($event,label,item);">
                        <span>{{label.text}}</span>
                        <md-tooltip md-direction="bottom" ng-if="label.desc">
                            {{label.desc}}
                        </md-tooltip>
                    </md-button>
                </md-content>
            </md-tab>
        </md-tabs>
        <#--<div class="btn-wrapper">
            <md-button class="md-icon-button" aria-label="Add">
                <md-tooltip md-direction="bottom">
                    标签值配置
                </md-tooltip>
                <a href="http://lion.dp/config/configList.vhtml?menu=project&pid=12672"
                   class="material-icons">settings</a>
            </md-button>
            <md-button class="md-icon-button" aria-label="Add" ng-if="configs.helpLink">
                <a ng-href="{{configs.helpLink}}"
                   class="material-icons">help</a>
            </md-button>
        </div>-->
    </md-content>
    <md-card>
        <md-toolbar class="md-table-toolbar md-default" aria-hidden="false">
            <div class="md-toolbar-tools table-toolbar">

                <md-select ng-model="query.bizId" style="width: 10em;" aria-label="Biz">
                    <md-option ng-repeat="item in configs.bizConfig" value="{{item.value}}">
                        {{item.text}}
                    </md-option>
                </md-select>

                <md-select ng-model="query.idType" style="width: 6em;" aria-label="ID类型">
                    <md-option ng-repeat="idType in idTypes" value="{{idType.value}}">
                        {{idType.text}}
                    </md-option>
                </md-select>

                <form name="filter.form" class="flex" style="margin: 0;" ng-submit="search()">
                    <input type="text" class="input_box" ng-model="searchData.ids" placeholder="请输入ID,多个ID用逗号或空格隔开"
                           aria-invalid="false">
                </form>
                <md-button class="md-icon-button" aria-label="Search" ng-click="search()">
                    <i class="material-icons">search</i>
                </md-button>
                <input id="fileInput" name="file" type="file" file-reader="readerHandler" class="ng-hide"
                       style="width: 0;height: 0;" accept=".csv"/>
                <md-button id="uploadButton" class="md-icon-button md-primary" aria-label="Upload"
                           ng-click="upload();">
                    <md-tooltip md-direction="bottom">
                        通过CSV文件上传门店ID,CSV文件仅包括一列门店ID
                    </md-tooltip>
                    <i class="material-icons">file_upload</i>
                </md-button>

            </div>
        </md-toolbar>
        <md-table-container ng-show="showTable === 1">
            <table md-table md-row-select multiple ng-model="selected" md-progress="promise">
                <thead md-head md-order="query.order" md-on-reorder="getDesserts">
                <tr md-row>
                    <th md-column md-numeric>门店ID</th>
                    <th md-column md-text>门店城市</th>
                    <th md-column md-text>门店名称</th>
                    <th md-column md-numeric>门店状态</th>
                    <th md-column ng-repeat="item in configs.labelConfig">{{item.name}}</th>

                    <th md-column md-numeric>轮转组ID
                        <md-tooltip md-direction="bottom">
                            ShopGroupId
                        </md-tooltip></th>
                    <th md-column md-numeric>门店组ID
                        <md-tooltip md-direction="bottom">
                            RotateGroupId
                        </md-tooltip></th>
                    <th md-column md-text>责任销售</th>
                </tr>
                </thead>
                <tbody md-body>
                <tr md-row md-select="shop" md-select-id="shop.shopId" md-auto-select ng-repeat="shop in shops">
                    <td md-cell>{{shop.shopId}}</td>
                    <td md-cell>{{shop.cityName}}</td>
                    <td md-cell>{{shop.shopName}}</td>
                    <td md-cell>{{shop.shopStatus}}</td>
                    <td md-cell ng-repeat="item in configs.labelConfig"
                        ng-init="itemData = getLabelText(item, shop.ratingList,shop.extendList)"
                        ng-style="itemData.isDefault ? {'color': 'grey','font-style': 'italic'} : ''">{{itemData.text}}
                    </td>
                    <td md-cell>{{shop.rotateId}}</td>
                    <td md-cell>{{shop.shopGroupId}}</td>
                    <td md-cell>{{shop.owner}}</td>
                </tr>
                </tbody>
            </table>
        </md-table-container>
        <!--<md-table-pagination md-limit="query.limit" md-limit-options="[10, 30, 50]" md-page="query.page"-->
        <!--md-total="{{shops.count}}" md-on-paginate="getDesserts"-->
        <!--md-page-select></md-table-pagination>-->
        <div ng-show="showTable === 2 && csvIdCount" style="padding: 24px;">
            <h3>{{csvFileName}}包含门店ID数量:&nbsp;{{csvIdCount}}</h3>
        </div>
    <#--<md-table-container class="m-list-content" ng-show="showTable === 2">-->
    <#--<div class="m-header" layout="row" layout-align="space-around center">-->
    <#--<div>ShopId</div>-->
    <#--<div>门店城市</div>-->
    <#--<div>门店名称</div>-->
    <#--<div>客户类型</div>-->
    <#--<div>门店状态</div>-->
    <#--<div>推荐客户</div>-->
    <#--<div>意向客户</div>-->
    <#--<div>KA标签</div>-->
    <#--<div>ShopGroupId</div>-->
    <#--<div>RotateId</div>-->
    <#--<div>责任销售</div>-->
    <#--</div>-->
    <#--<md-virtual-repeat-container id="vertical-container">-->
    <#--<div md-virtual-repeat="shop in dynamicItems" md-on-demand-->
    <#--class="repeated-item" layout="row" layout-align="space-around center">-->
    <#--<div>{{shop.shopId}}</div>-->
    <#--<div>{{shop.cityName}}</div>-->
    <#--<div>{{shop.shopName}}</div>-->
    <#--<div>{{shop.bigCustomer}}</div>-->
    <#--<div>{{shop.shopStatus}}</div>-->
    <#--<div>{{shop.recommend}}</div>-->
    <#--<div>{{shop.highQuality}}</div>-->
    <#--<div>{{shop.ka}}</div>-->
    <#--<div>{{shop.shopGroupId}}</div>-->
    <#--<div>{{shop.rotateId}}</div>-->
    <#--<div>{{shop.owner}}</div>-->
    <#--</div>-->
    <#--</md-virtual-repeat-container>-->
    <#--</md-table-container>-->


    </md-card>

    <div class="md-dialog-container" layout="row" layout-sm="column" layout-align="space-around" ng-if="progressing"
         style="position: fixed;">
        <md-progress-circular md-mode="indeterminate" style="position: fixed;top: 45%;"></md-progress-circular>
    </div>

</div>


<script>
    angular.module('ShopLabelTool', ['ngMaterial', 'ngResource', 'md.data.table'])
            .factory('SearchShopFactory', function ($resource) {
                return $resource('/roctools/searchshop', {}, {
                    post: {method: 'POST'} // Added `find` action
                });
            })
            .factory('SetLabelFactory', function ($resource) {
                return $resource('/roctools/setLabel', {}, {
                    post: {method: 'POST'} // Added `find` action
                });
            })
            .factory('LabelConfigFactory', function ($resource) {
                return $resource('/roctools/getLabelConfig');
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
            .directive('fileReader', function () {
                return {
                    scope: {
                        fileReader: "="
                    },
                    link: function (scope, element) {
                        Array.prototype.uniqueShopId = function () {
                            var res = [];
                            var json = {};
                            for (var i = 0; i < this.length; i++) {
                                if (Number.parseInt(this[i])) {
                                    if (!json[this[i]]) {
                                        res.push(Number.parseInt(this[i].trim()));
                                        json[this[i]] = -1;
                                    }
                                }
                            }
                            return res;
                        };
                        angular.element(element).on('change', function (changeEvent) {

                            var files = changeEvent.target.files;
                            if (files.length) {
                                var fileName = files[0].name;
                                var r = new FileReader();
                                r.onload = function (e) {
                                    var contents = e.target.result;
                                    scope.$apply(function () {
                                        var list = contents.split('\n');
                                        scope.fileReader(list.uniqueShopId(), fileName);

                                    });
                                };

                                r.readAsText(files[0]);
                            }
                        });
                    }
                };
            })
            .controller('ShopLabelToolCtrl', ['$scope', '$mdDialog', 'SearchShopFactory', 'SetLabelFactory', 'mToast', 'LabelConfigFactory',
                function ($scope, $mdDialog, SearchShopFactory, SetLabelFactory, mToast, LabelConfigFactory) {
                    $scope.progressing = false;
                    $scope.showTable = 2;
                    $scope.postData = {ids: []};
                    $scope.upload = function () {
                        $scope.showTable = 2;
                        angular.forEach(
                                angular.element("#fileInput"),
                                function (inputElem) {
                                    angular.element(inputElem).val(null);
                                });
                        angular.element('#fileInput').click();
                    };
                    $scope.getLabelText = function (item, ratings, extendList) {
                        var searchValues = ratings;

                        if (item.table == 'extend') {
                            searchValues = extendList;
                        }

                        for (var i = 0; i < item.labels.length; i++) {
                            if (searchValues.indexOf(item.labels[i].value) >= 0) {
                                return {
                                    isDefault:false,
                                    text:item.labels[i].text
                                }
                            }
                        }

                        return {
                            isDefault:true,
                            text:item.defaultText
                        }

                    };
                    $scope.csvIdCount = 0;
                    $scope.readerHandler = function (shopIds, fileName) {
                        $scope.csvFileName = fileName;
                        //$scope.dynamicItems = new DynamicItems();
                        $scope.csvIdCount = shopIds.length;
                        $scope.postData.ids = shopIds;
                    };

                    $scope.searchData = {ids: ''};
                    $scope.idTypes = [
                        {text: '门店ID', value: 'shopId'},
                        {text: '轮转组ID', value: 'rotateGroupId'},
                        {text: '门店组ID', value: 'shopGroupId'}];
                    $scope.configs = {};
                    var bizConfigs = [];
                    LabelConfigFactory.get()
                            .$promise
                            .then(function (rs) {
                                if (rs.code === 200) {
                                    $scope.configs = rs.data;
                                } else {
                                    $scope.showAlert(null,rs.msg);
                                }

                            }, function () {

                            });

                    function getIdsForQuery() {
                        var str = $scope.searchData.ids.trim();
                        var ids = [];
                        if(str.indexOf(",") < 0){
                            ids = str.split(" ");
                        }else {
                            ids = str.split(',');
                        }

                        for (var i = 0; i < ids.length; i++) {
                            ids[i] = parseInt(ids[i].trim())
                        }
                        return ids;
                    }

                    $scope.selected = [];

                    $scope.query = {
                        order: 'name',
                        limit: 10,
                        page: 1,
                        searchType: 'ids',
                        bizId: 104,
                        idType: 'shopId'
                    };

                    function success(rs) {
                        if (rs.code === 200) {
                            $scope.shops = rs.data;
                        } else {
                            $scope.shops = [];
                            $scope.showAlert(null,rs.msg);
                        }
                    }

                    $scope.search = function () {
                        $scope.showTable = 1;
                        $scope.getDesserts();
                    };
                    $scope.getDesserts = function () {
                        if ($scope.searchData.ids.trim() === '') {
                            mToast('请输入ID');
                            return;
                        }
                        $scope.query.ids = getIdsForQuery();
                        $scope.promise = SearchShopFactory.post($scope.query, success).$promise;
                    };

                    var dialogContent = {};
                    $scope.setLabel = function (event, data, item) {
                        if ($scope.progressing) {
                            return;
                        }
                        $scope.postData.operation = data.operation;
                        $scope.postData.actionType = data.value;
                        $scope.postData.table = item.table;
                        bizConfigs = item.type;
                        var ids = [];
                        if ($scope.showTable === 1) {
                            if ($scope.selected.length <= 0) {
                                mToast('未选择门店');
                                return;
                            }
                            for (var i = 0; i < $scope.selected.length; i++) {
                                ids.push($scope.selected[i].shopId)
                            }

                        } else if ($scope.showTable === 2) {
                            if ($scope.postData.ids.length <= 0) {
                                mToast('没有上传门店ID');
                                return;
                            }
                            ids = $scope.postData.ids
                        }
                        dialogContent.shopIdCount = ids.length;
                        dialogContent.bizText = data.text;
                        $scope.showConfirmDialog(event, function (bizTypes) {
                            $scope.selected = [];
                            $scope.progressing = true;
                            SetLabelFactory.post({
                                operation: $scope.postData.operation,
                                actionType: $scope.postData.actionType,
                                table: $scope.postData.table,
                                bizTypes: bizTypes,
                                selectedShopIds: ids
                            }).$promise.then(function (rs) {
                                if (rs.code == 200) {
                                    $scope.showAlert(event, rs.msg);

                                    if ($scope.showTable === 1) {
                                        $scope.getDesserts();
                                    }

                                } else {
                                    $scope.showAlert(event, "标记失败：" + rs.msg);
                                }
                                console.log(rs.data);
                                $scope.progressing = false;
                            }, function () {
                                $scope.progressing = false;
                            });
                        });

                    };
                    $scope.showAlert = function (ev, msg) {
                        // Appending dialog to document.body to cover sidenav in docs app
                        // Modal dialogs should fully cover application
                        // to prevent interaction outside of dialog
                        $mdDialog.show(
                                $mdDialog.alert()
                                        .parent(angular.element(document.body))
                                        .clickOutsideToClose(true)
                                        .title('提示')
                                        .textContent(msg)
                                        .ariaLabel('提示')
                                        .ok('确定')
                                        .targetEvent(ev)
                        );
                    };

                    $scope.showConfirm = function (ev, title, content, okFn) {
                        // Appending dialog to document.body to cover sidenav in docs app
                        var confirm = $mdDialog.confirm()
                                .title(title)
                                .textContent(content)
                                .ariaLabel('确认打标签')
                                .targetEvent(ev)
                                .ok('确定')
                                .cancel('取消');

                        $mdDialog.show(confirm).then(okFn, function () {

                        });
                    };
                    // In this example, we set up our model using a class.
                    // Using a plain object works too. All that matters
                    // is that we implement getItemAtIndex and getLength.
//                    var DynamicItems = function () {
//                        /**
//                         * @type {!Object<?Array>} Data pages, keyed by page number (0-index).
//                         */
//                        this.loadedPages = {};
//
//                        /** @type {number} Total number of items. */
//                        this.numItems = 0;
//
//                        /** @const {number} Number of items to fetch per request. */
//                        this.PAGE_SIZE = 50;
//
//                        this.fetchNumItems_();
//                    };
//
//                    // Required.
//                    DynamicItems.prototype.getItemAtIndex = function (index) {
//                        var pageNumber = Math.floor(index / this.PAGE_SIZE);
//                        var page = this.loadedPages[pageNumber];
//
//                        if (page) {
//                            return page[index % this.PAGE_SIZE];
//                        } else if (page !== null) {
//                            this.fetchPage_(pageNumber);
//                        }
//                    };
//
//                    // Required.
//                    DynamicItems.prototype.getLength = function () {
//                        return this.numItems;
//                    };
//
//                    DynamicItems.prototype.fetchPage_ = function (pageNumber) {
//                        // Set the page to null so we know it is already being fetched.
//                        this.loadedPages[pageNumber] = null;
//
//                        // For demo purposes, we simulate loading more items with a timed
//                        // promise. In real code, this function would likely contain an
//                        // $http request.
//                        var ids = [];
//                        var pageOffset = pageNumber * this.PAGE_SIZE;
//                        for (var i = pageOffset; i < pageOffset + this.PAGE_SIZE; i++) {
//                            ids.push(csvIds[i]);
//                        }
//                        $scope.query.ids = ids;
//                        var self = this;
//                        SearchShopFactory.post($scope.query).$promise.then(function (rs) {
//                            if (rs.code === 200) {
//                                console.log(rs.msg);
////                                $timeout(angular.noop, 0).then(angular.bind(this, function () {
////                                    angular.bind(self, function () {
////                                        self.loadedPages[pageNumber] = [];
////                                        var pageOffset = pageNumber * self.PAGE_SIZE;
//////                                    for (var i = pageOffset; i < pageOffset + self.PAGE_SIZE; i++) {
//////
//////                                        self.loadedPages[pageNumber].push(i);
//////                                    }
////                                        self.loadedPages[pageNumber] = rs.msg;
////                                    }
////                                }));
//                                self.loadedPages[pageNumber] = rs.msg;
//                            } else {
//                                alert(rs.msg)
//                            }
//                        });
//
////                        $timeout(angular.noop, 0).then(angular.bind(this, function () {
////                            this.loadedPages[pageNumber] = [];
////                            var pageOffset = pageNumber * this.PAGE_SIZE;
////                            for (var i = pageOffset; i < pageOffset + this.PAGE_SIZE; i++) {
////                                this.loadedPages[pageNumber].push(i);
////                            }
////                        }));
//                    };
//
//                    DynamicItems.prototype.fetchNumItems_ = function () {
//                        // For demo purposes, we simulate loading the item count with a timed
//                        // promise. In real code, this function would likely contain an
//                        // $http request.
//
//                        $timeout(angular.noop, 0).then(angular.bind(this, function () {
//                            this.numItems = csvIds.length;
//                        }));
//                    };

                    function ConfirmDialogController($scope, $mdDialog) {
                        $scope.bizConfigs = bizConfigs;
                        $scope.selected = [];
                        $scope.content = dialogContent;
                        $scope.toggle = function (item, list) {
                            var idx = list.indexOf(item);
                            if (idx > -1) {
                                list.splice(idx, 1);
                            }
                            else {
                                list.push(item);
                            }
                        };

                        $scope.exists = function (item, list) {
                            return list.indexOf(item) > -1;
                        };
                        $scope.hide = function () {
                            $mdDialog.hide();
                        };

                        $scope.cancel = function () {
                            $mdDialog.cancel();
                        };

                        $scope.answer = function () {
                            if ($scope.selected.length <= 0) {
                                mToast("请选择Biz");
                                return;
                            }
                            var result = [];
                            for (var i = 0; i < $scope.bizConfigs.length; i++) {
                                if ($scope.selected.indexOf($scope.bizConfigs[i].biz) >= 0) {
                                    result.push({type: $scope.bizConfigs[i].value, biz: $scope.bizConfigs[i].biz})
                                }
                            }

                            $mdDialog.hide(result);
                        };
                    }

                    $scope.showConfirmDialog = function (ev, okFn) {
                        $mdDialog.show({
                            controller: ConfirmDialogController,
                            templateUrl: '/roctools/static/tpl/confirmDialog.tpl',
                            parent: angular.element(document.body),
                            targetEvent: ev,
                            clickOutsideToClose: true,
                            fullscreen: true // Only for -xs, -sm breakpoints.
                        }).then(function (answer) {
                            okFn(answer)
                        }, function () {

                        });
                    };

                }]);

</script>