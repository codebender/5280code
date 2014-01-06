angular.module('appControllers',
['app.controllers.menu'
 'app.controllers.home'
 'app.controllers.bitcoin'
 'app.controllers.fitness'
 'app.directives.price'
])

angular.module('app', ['appControllers', 'ngRoute', 'pubnub.angular.service'])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        template: '<div ng-controller="homeCtrl">Life is good: {{bitcoin_price}}</div>'
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
