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
        template: JST['angular/app/templates/home']
      .when '/fitness',
        template: JST['angular/app/templates/fitness']
      .when '/meetups',
        template: JST['angular/app/templates/meetups']
      .when '/bitcoin',
        template: JST['angular/app/templates/bitcoin']
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode(true)
