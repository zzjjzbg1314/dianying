<md-dialog aria-label="List dialog">
    <md-dialog-content>
        <md-list>
            <#--<md-list-item ng-repeat="item in items">-->
                <p>Number {{item}}</p>
<#--
            </md-list-item>
-->
        </md-list>
    </md-dialog-content>
    <md-dialog-actions>
        <md-button ng-click="closeDialog()" class="md-primary">Close Dialog</md-button>
    </md-dialog-actions>
</md-dialog>