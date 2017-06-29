<md-dialog aria-label="确认" style="width: 480px;" >
    <form ng-cloak>
        <md-toolbar>
            <div class="md-toolbar-tools">
                <h2>确认?</h2>
                <span flex></span>
                <md-button class="md-icon-button" ng-click="cancel()">
                    <md-icon class="material-icons">close</md-icon>
                </md-button>
            </div>
        </md-toolbar>

        <md-dialog-content>
            <div class="md-dialog-content">
                <fieldset class="standard" >
                    <legend style="font-size: 1em;">请选择Biz:</legend>
                    <div layout="row" layout-wrap flex>
                        <div flex="50" ng-repeat="item in bizConfigs">
                            <md-checkbox ng-checked="exists(item.biz, selected)" ng-click="toggle(item.biz, selected)">
                               <span style="white-space: nowrap"> {{ item.text }}({{item.biz}})</span>
                            </md-checkbox>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="standard" >
                    <!--<legend style="font-size: 1em;">提示</legend>-->
                    <div layout="row" layout-wrap flex>
                       将所选{{content.shopIdCount}}个门店标记为{{content.bizText}}
                    </div>
                </fieldset>
            </div>
        </md-dialog-content>

        <md-dialog-actions layout="row">
            <span flex></span>
            <md-button ng-click="cancel()">
                取消
            </md-button>
            <md-button ng-click="answer()">
                确定
            </md-button>
        </md-dialog-actions>
    </form>
</md-dialog>