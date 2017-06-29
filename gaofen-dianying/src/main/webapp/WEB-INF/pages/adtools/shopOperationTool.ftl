<script src="/roctools/static/js/jquery.min.js"></script>
<script src="/roctools/static/components/angular/angular.min.js"></script>
<script src="/roctools/static/components/angular-resource/angular-resource.min.js"></script>
<script src="/roctools/static/components/angular-aria/angular-aria.min.js"></script>
<script src="/roctools/static/components/angular-animate/angular-animate.min.js"></script>
<script src="/roctools/static/components/angular-material/angular-material.min.js"></script>
<script src="/roctools/static/components/angular-dropdown-multiselect/angularjs-dropdown-multiselect.min.js"></script>
<script src="/roctools/static/components/angular-material-data-table/md-data-table.min.js"></script>
<link rel="stylesheet" href="/roctools/static/components/angular-material/angular-material.min.css"/>
<link rel="stylesheet" href="/roctools/static/components/angular-material-data-table/md-data-table.min.css"/>

<script type="application/javascript">var ENV={menuKey:"roc.shopoperationtool",menuRouter:true}</script>
<div class="container" ng-app="myApp" ng-controller="shopOperationToolCtrl">
    <h3 style="text-align:center;">
        门店运营大工具
    </h3>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="col-sm-6">
                            请输入shopId
                            <input class="input-medium search-query" type="text" ng-model="shopId"/>
                            <button type="submit" class="btn" ng-click="queryApolloShopByShopId($event)">查找</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!--推广BIZ轮转信息 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="pull-left">推广BIZ轮转信息</span>
            </div>
        </div>
        <div class="panel-body ">
            <div>
                <table class="table table-bordered">
                    <tr>
                        <td bgcolor="f2f4f9" width=25%>
                            战区
                        </td>
                        <td>
                            {{RotateInfo.TerritoryName}}
                        </td>
                        <td bgcolor="f2f4f9" width=25%>
                            现轮转组ID
                        </td>
                        <td>
                            {{RotateInfo.RotateGroupID}}
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="f2f4f9">
                            门店类型
                        </td>
                        <td>
                            {{RotateInfo.ApolloShopType}}
                        </td>
                        <td bgcolor="f2f4f9">
                            客户类型
                        </td>
                        <td>
                            {{RotateInfo.CustomerType}}
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="f2f4f9">
                            责任销售
                        </td>
                        <td>
                            {{RotateInfo.SalesMan}}
                        </td>
                        <td bgcolor="f2f4f9">
                            私海合作状态
                        </td>
                        <td>
                            {{RotateInfo.RotateGroupUserStatus}}
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>



    <!--当前轮转组信息-->
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="pull-left">当前轮转组:{{RotateInfo.RotateGroupID}}</span>
            </div>
        </div>
        <div class="panel-body ">
            <div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>门店名称</th>
                        <th>ShopId</th>
                        <th>上线时间</th>
                        <th>下线时间</th>
                        <th>门店拜访历史</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="RotateInfo in RotateListInfo" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                        <td><a ng-href="../../rocshop/shopInfo/view?shopId={{RotateInfo.shopId}}">{{RotateInfo.shopName}}</a></td>
                        <td ng-bind="RotateInfo.shopId"></td>
                        <td ng-bind="RotateInfo.onlineDate | date:'yyyy-MM-dd HH:mm:ss'"></td>
                        <td ng-bind="RotateInfo.offlineDate | date:'yyyy-MM-dd HH:mm:ss'"></td>
                        <td>
                            <p ng-repeat="visit in RotateInfo.visitHistoryDTOList" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]" >
                                拜访人:{{visit.createdPerson}} 联系人:{{visit.visitedPerson}} {{visit.contactType}} 拜访目的:{{visit.stage}} 时间:{{ visit.visitDate | date:'yyyy-MM-dd' }}
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 门店历史信息展示-->

    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="pull-left">当前轮转组历史信息</span>
            </div>
        </div>
        <div class="panel-body ">
            <div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ShopId</th>
                        <th>原RotateGroupId</th>
                        <th>新RotateGroupId</th>
                        <th>变更原因</th>
                        <th>操作人</th>
                        <th>操作时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="shophistory in ShopHistoryInfo" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                        <td ng-bind="shophistory.shopId"></td>
                        <td ng-bind="shophistory.oldValue"></td>
                        <td ng-bind="shophistory.newValue"></td>
                        <td ng-bind="shophistory.memo"></td>
                        <td ng-bind="shophistory.operatorUser"></td>
                        <td ng-bind="shophistory.operatorTime | date:'yyyy-MM-dd HH:mm:ss'"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--历史轮转组信息 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="pull-left">历史轮转组信息</span>
            </div>
        </div>
    </div>

    <div ng-repeat="RotateGroupHistory in RotateGroupHistorys">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix">
                <span class="pull-left">当前轮转组:{{RotateGroupHistory.rotateGroupId}}</span>
            </div>
        </div>
        <div class="panel-body ">
            <div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>门店名称</th>
                        <th>ShopId</th>
                        <th>上线时间</th>
                        <th>下线时间</th>
                        <th>门店拜访历史</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="RotateInfo in RotateGroupHistory.rotateGroupShopDetailInfoDTOList" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                        <td><a ng-href="../../rocshop/shopInfo/view?shopId={{RotateInfo.shopId}}">{{RotateInfo.shopName}}</a></td>
                        <td ng-bind="RotateInfo.shopId"></td>
                        <td ng-bind="RotateInfo.onlineDate | date:'yyyy-MM-dd HH:mm:ss'"></td>
                        <td ng-bind="RotateInfo.offlineDate | date:'yyyy-MM-dd HH:mm:ss'"></td>
                        <td>
                            <p ng-repeat="visit in RotateInfo.visitHistoryDTOList">
                                拜访人:{{visit.createdPerson}} 联系人:{{visit.visitedPerson}} {{visit.contactType}} 拜访目的:{{visit.stage}} 时间:{{ visit.visitDate | date:'yyyy-MM-dd' }}
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>

</div>


<script>

    angular.module('myApp', ['ngMaterial'])

            .controller('shopOperationToolCtrl',function ($scope, $http,$mdDialog) {
                $scope.customFullscreen = false;

                $scope.queryApolloShopByShopId = function (ev) {
                    if(angular.isUndefined($scope.shopId)){
                        $scope.showAlert(ev);
                    }else{
                        $http({
                            method:'POST',
                            url:'/roctools/getapolloshopbyshopid',
                            data:{shopId:$scope.shopId}
                        }).then(function successCallback(response){
                                    $scope.RotateInfo = response.data.data.BizInfo;
                                    $scope.RotateListInfo=response.data.data.RotateGroupInfo;
                                    $scope.ShopHistoryInfo =response.data.data.ShopHistoryInfo;
                                    $scope.RotateGroupHistorys =response.data.data.RotateGroupHistoryInfo;
                                    console.log($scope.RotateGroupHistorys);
                                }
                                ,function errorCallback(response) {
                                    throw new Error('getapolloshopbyshopid happen wrong......');
                                } )
                    }
                }




                $scope.showAlert = function(ev) {
                    $mdDialog.show(
                            $mdDialog.alert()
                                    .parent(angular.element(document.querySelector('#popupContainer')))
                                    .clickOutsideToClose(true)
                                    .title('有情提示!')
                                    .textContent('请输入shopId!')
                                    .ariaLabel('Alert Dialog Demo')
                                    .ok('OK!')
                                    .targetEvent(ev)
                    );
                };


            });






</script>







