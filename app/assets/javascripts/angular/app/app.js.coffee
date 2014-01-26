angular.module('appControllers',
['app.controllers.menu'
 'app.controllers.home'
 'app.controllers.bitcoin'
 'app.controllers.fitness'
 'app.controllers.coderwall'
])

angular.module('appDirectives',
['app.directives.price'
])

angular.module('app', ['appControllers', 'appDirectives', 'ngRoute', 'ui.bootstrap'])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        template: '<div ng-controller="homeCtrl">Life is good: {{bitcoin_price}}</div>' +
          '<div class="col-md-4 pull-right" ng-controller="coderwallCtrl">'+
            '<h4>Coderwall Badges</h4>'+
            '<div class="row">' +
              '<div class="col-md-4" ng-repeat="badge in badges">' +
                '<a href="https://coderwall.com/misterbender" tooltip-html-unsafe="<b>{{badge.name}}</b><br/>{{badge.description}}">'+
                  '<img class="img-responsive" ng-src="{{badge.badge}}" />' +
                '</a>' +
                '<div class="label label-info center-block">{{badge.created | date: "MM/dd/yyyy" }}</div>' +
              '</div>' +
            '</div>' +
          '</div>'
      .when '/fitness',
        template: '<b>fitness</b>'
      .when '/meetups',
        template: '<b>meetups</b>'
      .when '/bitcoin',
        template: '<h1>Live Bitcoin Price</h1>'+
          '<p class="lead">Streamed with <a href="http://pubnub.com">PubNum</a> from <a href="http://mtgox.com">Mt.Gox</a></p>' +
          '<div ng-controller="bitcoinCtrl">' +
            '<div class="well col-md-6">'+
              '<div class="pull-right"><small class="text-muted">Last Updated: {{bitcoin_ticker.now/1000 | date:"medium"}}</small></div>'+
              '<div class="row">' +
                '<div class="col-md-12"><h3>Last Price: <price current={{bitcoin_ticker.last.value}}></price></h3></div>' +
              '</div>' +
              '<div class="row">' +
                '<div class="col-md-12"><h3>24 Hour Range: <price current={{bitcoin_ticker.low.value}}></price> - <price current={{bitcoin_ticker.high.value}}></price></h3></div>' +
              '</div>' +
            '</div>' +
          '</div>'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode(true)
