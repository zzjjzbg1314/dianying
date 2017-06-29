<md-dialog aria-label="Mango (Fruit)">
  <form ng-cloak>
    <md-toolbar>
      <div class="md-toolbar-tools">
        <h2>Mango (Fruit)</h2>
        <span flex></span>
        <md-button class="md-icon-button" ng-click="cancel()">
          <md-icon md-svg-src="img/icons/ic_close_24px.svg" aria-label="Close dialog"></md-icon>
        </md-button>
      </div>
    </md-toolbar>

    <md-dialog-content>
      <div class="md-dialog-content">
        <md-content md-theme="docs-dark" layout-gt-sm="row" layout-padding>
            <div>
                <md-input-container>
                <label>Title</label>
                <input ng-model="labelGroup.name">
                </md-input-container>
            <md-input-container>            
            <label>Email</label>
            <input ng-model="labelGroup.desc" >
            </md-input-container>
            </div>
        </md-content>
    </div>
    </md-dialog-content>

    <md-dialog-actions layout="row">
      <md-button href="http://en.wikipedia.org/wiki/Mango" target="_blank" md-autofocus>
        More on Wikipedia
      </md-button>
      <span flex></span>
      <md-button ng-click="answer('not useful')">
       Not Useful
      </md-button>
      <md-button ng-click="answer('useful')">
        Useful
      </md-button>
    </md-dialog-actions>
  </form>
</md-dialog>