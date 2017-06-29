<#--<script src="/roctools/static/bootstrap-3.37-dist/js/bootstrap.min.js"></script>-->
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
<#--<link rel="stylesheet" href="/roctools/static/bootstrap-3.37-dist/css/bootstrap.min.css"/>-->

<div class="container" ng-app="myApp" ng-controller="labelToolCtrl">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-pills" id="myTab">
                <#--<li class="active">
                    <a href="#label" data-toggle="tab">标签管理</a>
                </li>-->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            标签管理
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#label1" data-toggle="tab">推广</a></li>
                            <li><a href="#label2" data-toggle="tab">品牌</a></li>
                        </ul>
                    </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        标签组管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#labelgroup1" data-toggle="tab">推广</a></li>
                        <li><a href="#labelgroup2" data-toggle="tab">品牌</a></li>
                    </ul>
                </li>
            </ul>
            <!--标签管理 -->
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="label1">
                    <table class="table" id="labelTable">
                        <thead>
                        <tr>
                            <th>推广标签ID</th>
                            <th>名称</th>
                            <th>描述</th>
                            <th>标签组</th>
                            <th>是否门店筛选</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="label in labels1" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                            <td ng-bind="label.labelid"></td>
                            <td ng-bind="label.name"></td>
                            <td ng-bind="label.desc"></td>
                            <td ng-bind="label.labelGroupName"></td>
                            <td ng-bind="label.ifShopIndex"></td>
                            <td align="center">
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="editLabelDialogShow($event,label)">编辑</button>
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="addLabelDialogShow($event)">添加</button>
                                <button type="submit" class="btn" ng-click="showConfirmLabel($event,label.id,label.labelid,label.bizId,label.labelGroupName)">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <div class="tab-pane fade in active" id="label2">
                    <table class="table" id="labelTable">
                        <thead>
                        <tr>
                            <th>品牌标签ID</th>
                            <th>名称</th>
                            <th>描述</th>
                            <th>标签组</th>
                            <th>是否门店筛选</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="label in labels2" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                            <td ng-bind="label.labelid"></td>
                            <td ng-bind="label.name"></td>
                            <td ng-bind="label.desc"></td>
                            <td ng-bind="label.labelGroupName"></td>
                            <td ng-bind="label.ifShopIndex"></td>
                            <td align="center">
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="editLabelDialogShow($event,label)">编辑</button>
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="addLabelDialogShow($event)">添加</button>
                                <button type="submit" class="btn" ng-click="showConfirmLabel($event,label.id,label.labelid,label.bizId,label.labelGroupName)">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <!--标签组1 -->
                <div class="tab-pane fade" id="labelgroup1">
                    <table class="table" id="labelGroupTable">
                        <thead>
                        <tr>
                            <th>推广标签组</th>
                            <th>类型名称</th>
                            <th>类型描述</th>
                            <th>是否门店筛选</th>
                            <th>修改者</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="labelGroup in labelGroups1" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                            <td ng-bind="labelGroup.id"></td>
                            <td ng-bind="labelGroup.name"></td>
                            <td ng-bind="labelGroup.desc"></td>
                            <td ng-bind="labelGroup.ifShopIndex"></td>
                            <td ng-bind="labelGroup.updateby"></td>
                            <td align="center">
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="editLabelGroupDialogShow($event,labelGroup)">编辑</button>
                                <button type="submit" class="btn" ng-click="showConfirmLabelGroup($event,labelGroup.id)">删除</button>
                                <button type="submit" class="btn" data-toggle="modal" ng-click="showAddLabelGroupDialog($event)">添加</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!--标签组2 -->
                <div class="tab-pane fade" id="labelgroup2">
                    <table class="table" id="labelGroupTable">
                        <thead>
                        <tr>
                            <th>品牌标签组</th>
                            <th>类型名称</th>
                            <th>类型描述</th>
                            <th>是否门店筛选</th>
                            <th>修改者</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="labelGroup in labelGroups2" ng-class="[{true:'index'+$index}[true], {0:'error', 1:'success',2:'error',3:'warning',4:'info'}[ $index % 5 ]]">
                            <td ng-bind="labelGroup.id"></td>
                            <td ng-bind="labelGroup.name"></td>
                            <td ng-bind="labelGroup.desc"></td>
                            <td ng-bind="labelGroup.ifShopIndex"></td>
                            <td ng-bind="labelGroup.updateby"></td>
                            <td align="center">
                                <button type="submit" class="btn" data-toggle="modal"  ng-click="editLabelGroupDialogShow($event,labelGroup)">编辑</button>
                                <button type="submit" class="btn" ng-click="showConfirmLabelGroup($event,labelGroup.id)">删除</button>
                                <button type="submit" class="btn" data-toggle="modal" ng-click="showAddLabelGroupDialog($event)">添加</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <!-- 添加标签对话框架-->
    <div class="modal fade" id="AddLabelDialog" data-backdrop="static"
         data-keyboard="false" aria-hidden="true">
        <div class="modal-dialog" style="width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="tv-iui-createMatchRuleTitle">添加标签</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="editOrAddLabelForm"
                          ng-submit="submitAddLabelForm($scope)" novalidate>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签名称</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="addNewLabel.name" required >
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签描述</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="addNewLabel.desc" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">推广标签组</span> <span
                                    class="required"></span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                            <select class="form-control"  ng-model="addNewLabel.tglabelgroup"
                                    ng-options="labelgroup.name for labelgroup in labelgrouptype1tg">
                            </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">品牌标签组</span> <span
                                    class="required"></span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <select class="form-control"  ng-model="addNewLabel.pplabelgroup"
                                        ng-options="labelgroup.name for labelgroup in labelgrouptype1pp">
                                </select>
                            </div>
                        </div>


                        <#--<div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">是否门店筛选</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <label>
                                    <input type ="radio" ng-model="addNewLabel.ifShopIndex" value="是">
                                    是
                                </label>
                                <label>
                                    <input type ="radio" ng-model="addNewLabel.ifShopIndex" value="否">
                                    否
                                </label>
                            </div>
                        </div>-->

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!--编辑标签对话框 -->
    <div class="modal fade" id="EditLabelDialog" data-backdrop="static"
         data-keyboard="false" aria-hidden="true">
        <div class="modal-dialog" style="width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="tv-iui-createMatchRuleTitle">标签编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="editOrAddLabelForm"
                          ng-submit="submitEditLabelForm($scope)" novalidate>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签名称</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="newLabel.name" required >
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签描述</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="newLabel.desc" required>
                            </div>
                        </div>

                        <div class="form-group" ng-hide="editLabelHide1">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">是否门店筛选</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <label>
                                    <input type ="radio"  ng-model="newLabel.ifShopIndex" value="是">
                                    是
                                </label>
                                <label>
                                    <input type ="radio" ng-model="newLabel.ifShopIndex" value="否">
                                    否
                                </label>
                            </div>
                        </div>
                        <div class="form-group" ng-hide="editLabelHide2">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">是否门店筛选</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <label>
                                    <input type ="radio"  ng-model="newLabel.ifShopIndex" value="是" disabled="true">
                                    是
                                </label>
                                <label>
                                    <input type ="radio" ng-model="newLabel.ifShopIndex" value="否" disabled="true">
                                    否
                                </label>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 编辑标签组对话 -->
    <div class="modal fade" id="EditLabelGroupDialog" data-backdrop="static"
         data-keyboard="false" aria-hidden="true">
        <div class="modal-dialog" style="width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="tv-iui-createMatchRuleTitle">标签组编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="editOrAddLabelForm"
                          ng-submit="submitEditLabelGroupForm($scope)" novalidate>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签组名称</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="newLabelGroup.name" required disabled="true">
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">类型描述</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="newLabelGroup.desc" required disabled="true">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">所属业务</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <select  class="form-control"  ng-model="newLabelGroup.bizid" disabled="disabled">
                                    <option value="104" ng-selected="newLabelGroup.bizid=='104'">推广</option>
                                    <option value="121" ng-selected="newLabelGroup.bizid=='121'">品牌</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">是否门店筛选</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <label>
                                    <input type ="radio" ng-model="newLabelGroup.ifShopIndex" value="是">
                                    是
                                    </label>
                                    <label>
                                        <input type ="radio" ng-model="newLabelGroup.ifShopIndex" value="否">
                                        否
                                    </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="AddLabelGroupDialog" data-backdrop="static"
                   data-keyboard="false" aria-hidden="true">
        <div class="modal-dialog" style="width: 50%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="tv-iui-createMatchRuleTitle">添加标签组</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="editOrAddLabelForm"
                          ng-submit="submitAddLabelGroupForm($scope)" novalidate>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">标签组名称</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="addLabelGroup.name" required>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">类型描述</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <input type="text" class="form-control"
                                       ng-model="addLabelGroup.desc" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">所属业务</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <select  class="form-control"  ng-model="addLabelGroup.bizid">
                                    <option value="104" ng-selected="addLabelGroup.bizid=='104'">推广</option>
                                    <option value="121" ng-selected="addLabelGroup.bizid=='121'">品牌</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group" >
                            <label class="control-label col-lg-3 col-sm-3 col-xs-3" for="promiseSpeed-input"> <span
                                    id="tv-iui-peakSpeedLabel">是否门店筛选</span> <span
                                    class="required">*</span>
                            </label>
                            <div class="col-lg-7 col-sm-7 col-xs-7">
                                <label>
                                    <input type ="radio" ng-model="addLabelGroup.ifShopIndex" value="是">
                                    是
                                </label>
                                <label>
                                    <input type ="radio" ng-model="addLabelGroup.ifShopIndex" value="否">
                                    否
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




<script>

    angular.module('myApp', ['ngMaterial','angularjs-dropdown-multiselect'])

            .factory('labelGroupServiceFactory',function ($http) {
                return{
                    //删除标签组
                    deleteLabelGroup:function (id) {
                        return $http({
                            method:'POST',
                            url:'/roctools/comfirmDeleteLabelGroup',
                            data:{'id':id}
                        }).then(function successCallback(response) {
                                }
                                ,function errorCallback(response) {
                                    throw new Error('query comfirmDeleteLabelGroup happen wrong......');
                                } )
                            }
                    

                    };
            })



            .controller('labelToolCtrl',function ($scope,$window, $http,$mdDialog,labelGroupServiceFactory) {
                $scope.addLabelGroup = {};
                $scope.addNewLabel ={};
                $scope.reloadRoute = function () {
                    $window.location.reload();
                }

                /*获取某个对象的属性*/
                function allPrpos(obj) {
                    // 用来保存所有的属性名称和值
                    var props = "";
                    // 开始遍历
                    for(var p in obj){
                        if(typeof(obj[p])=="function"){ // 方法
                            //console.log(obj[p]);
                        }else{
                            // p 为属性名称，obj[p]为对应属性的值
                            props += p + "=" + obj[p] + "; ";
                        }
                    }
                    // 最后显示所有的属性
                    console.log(props);
                }

                $scope.showConfirmLabelGroup = function(ev,id) {
                var confirm = $mdDialog.confirm()
                        .title('确认删除嘛?')
                        .textContent('该数据比较重要,请确认操作!')
                        .ariaLabel('Lucky day')
                        .targetEvent(ev)
                        .ok('YES!')
                        .cancel('NO!');

                $mdDialog.show(confirm).then(function() {
                    //确认删除
                    labelGroupServiceFactory.deleteLabelGroup(id);
                    $scope.showSuccessAlert();

                }, function() {
                    //$scope.status = 'You decided to keep your debt.';
                });
                }

                $scope.showConfirmLabel = function(ev,id,labelid,bizId,labelGroupName) {
                var confirm = $mdDialog.confirm()
                        .title('确认删除嘛?')
                        .textContent('该数据比较重要,请确认操作!')
                        .ariaLabel('Lucky day')
                        .targetEvent(ev)
                        .ok('YES!')
                        .cancel('NO!');

                $mdDialog.show(confirm).then(function() {
                    $http({
                    method:'POST',
                    url:'/roctools/comfirmDeleteLabel',
                    data:{id:id
                        ,labelid:labelid
                        ,bizId:bizId
                        ,labelGroupName:labelGroupName
                    },
                }).then(function successCallback(response){
                    $scope.showSuccessAlert();
                    },function errorCallback(response) {
                        throw new Error('query comfirmDeleteLabel happen wrong......');
                    } )
                }, function() {
                    //$scope.status = 'You decided to keep your debt.';
                })
                }

                $scope.showSuccessAlert = function(ev) {
                    $mdDialog.show(
                            $mdDialog.alert()
                                    .parent(angular.element(document.querySelector('#popupContainer')))
                                    .clickOutsideToClose(true)
                                    .title('操作成功')
                                    .textContent('您已经操作成功,请刷新页面显示!')
                                    .ariaLabel('Alert Dialog Demo')
                                    .ok('Got it!')
                                    .targetEvent(ev)
                    );
                }

                <!--添加标签对话框 -->
                $scope.addLabelDialogShow = function(ev){
                    $('#AddLabelDialog').modal('show');
                };

                <!--确认添加标签操作 -->
                $scope.submitAddLabelForm=function (ev) {
                    if(angular.isUndefined($scope.addNewLabel.pplabelgroup)){
                        ppLabelGroupId=0;
                    }else{
                        ppLabelGroupId =$scope.addNewLabel.pplabelgroup.id;
                    }
                    if(angular.isUndefined($scope.addNewLabel.tglabelgroup)){
                        tgLabelGroupId=0;
                    }else{
                        tgLabelGroupId=$scope.addNewLabel.tglabelgroup.id;
                    }
                    console.log(ppLabelGroupId);
                    console.log(tgLabelGroupId);
                    //console.log($scope.addNewLabel.ifShopIndex);

                    $http({
                        method:'POST',
                        url:'/roctools/addLabel',
                        data:{
                            name:$scope.addNewLabel.name,
                            desc:$scope.addNewLabel.desc,
                            ppLabelGroupId:ppLabelGroupId,
                            tgLabelGroupId:tgLabelGroupId
                            //ifShopIndex:$scope.addNewLabel.ifShopIndex
                        }
                    }).then(function successCallback(response){
                                $('#AddLabelDialog').modal('hide');
                                $scope.showSuccessAlert();
                            }
                            ,function errorCallback(response) {
                                throw new Error('query addLabel happen wrong......'+response.msg);
                            } )

                }
                <!-- 显示编辑标签-->
                $scope.editLabelDialogShow = function(ev,label){
                    $scope.newLabel =angular.copy(label);
                    console.log(label.ifLabelGroupShopIndex)
                    if(label.ifLabelGroupShopIndex =="否"){
                        $scope.editLabelHide1=true;
                        $scope.editLabelHide2=false;
                    }else{
                        $scope.editLabelHide1=false;
                        $scope.editLabelHide2=true;
                    }
                    console.log($scope.editLabelHide1);
                    console.log($scope.editLabelHide2);

                    $('#EditLabelDialog').modal('show');
                };
                <!--编辑标签确认-->
                $scope.submitEditLabelForm=function (ev) {


                    $http({
                        method:'POST',
                        url:'/roctools/editLabel',
                        data:{
                            name:$scope.newLabel.name,
                            desc:$scope.newLabel.desc,
                            ifShopIndex:$scope.newLabel.ifShopIndex,
                            id:$scope.newLabel.id,
                            bizId:$scope.newLabel.bizId
                        }
                    }).then(function successCallback(response){
                                $('#EditLabelDialog').modal('hide');
                                $scope.showSuccessAlert();
                            }
                            ,function errorCallback(response) {
                                throw new Error('query editLabel happen wrong......'+response.msg);
                            } )

                };

                <!-- 显示添加标签组-->
                $scope.showAddLabelGroupDialog=function (ev) {

                    $('#AddLabelGroupDialog').modal('show');
                }

                <!--确认添加标签组 -->
                $scope.submitAddLabelGroupForm=function (ev) {
                    $http({
                        method:'POST',
                        url:'/roctools/addLabelGroup',
                        data:{bizId:$scope.addLabelGroup.bizid,
                              name:$scope.addLabelGroup.name,
                              desc:$scope.addLabelGroup.desc,
                            ifShopIndex:$scope.addLabelGroup.ifShopIndex
                        }
                    }).then(function successCallback(response){
                            $('#AddLabelGroupDialog').modal('hide');
                            $scope.showSuccessAlert();
                            }
                            ,function errorCallback(response) {
                                throw new Error('query getlabelGrouplistByBizId happen wrong......'+response.msg);
                            } )

                }


                <!--显示编辑便签组 -->
                $scope.editLabelGroupDialogShow = function(ev,labelGroup){
                    $scope.newLabelGroup =angular.copy(labelGroup);
                    $('#EditLabelGroupDialog').modal('show');

                };

                <!--编辑标签组确认-->
                $scope.submitEditLabelGroupForm=function (ev) {
                    var  ifShopIndex=$scope.newLabelGroup.ifShopIndex;
                    var id=$scope.newLabelGroup.id;
                    $http({
                        method:'POST',
                        url:'/roctools/editLabelGroup',
                        data:{id:id,
                            ifShopIndex:ifShopIndex,
                            bizId:$scope.newLabelGroup.bizid
                        }
                    }).then(function successCallback(response){
                                $('#EditLabelGroupDialog').modal('hide');
                                $scope.showSuccessAlert();
                    }
                            ,function errorCallback(response) {
                                throw new Error('query editLabelGroup happen wrong......'+response.msg);
                            } )

                }

                $scope.showAddLabel = function(ev){
                    $('#AddLabelDialog').modal('show');
                };



                $http({
                    method: 'GET',
                    url: '/roctools/getlabellist'
                }).then(function successCallback(response) {
                            $scope.labels1 = response.data.data.TG;
                            $scope.labels2 = response.data.data.PP;
                        }, function errorCallback(response) {
                            throw new Error('query labelList happen wrong......');
                        }
                )

                $http({
                    method: 'GET',
                    url: '/roctools/getlabelgrouptype1'
                }).then(function successCallback(response) {

                            $scope.labelgrouptype1tg = response.data.data.TG;
                            $scope.labelgrouptype1pp = response.data.data.PP;

                        }, function errorCallback(response) {
                            throw new Error('query getlabelgrouptype1 happen wrong......');
                        }
                )

                $http({
                    method:'POST',
                    url:'/roctools/getlabelGrouplistByBizId',
                    data:{bizId:'104'}
                }).then(function successCallback(response){
                    $scope.labelGroups1 = response.data.data;}
                      ,function errorCallback(response) {
                            throw new Error('query getlabelGrouplistByBizId happen wrong......');
                        } )

                $http({
                    method:'POST',
                    url:'/roctools/getlabelGrouplistByBizId',
                    data:{bizId:'121'},
                }).then(function successCallback(response){
                        $scope.labelGroups2 = response.data.data;}
                    ,function errorCallback(response) {
                        throw new Error('query getlabelGrouplistByBizId happen wrong......');
                    } )
            });





    $(document).ready(function () {

        $('#myTab li:eq(0) a').tab('show');

    });
</script>