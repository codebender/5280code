angular.module('appControllers',
['app.controllers.menu'
 'app.controllers.home'
 'app.controllers.fitness'
])

angular.module('app', ['appControllers', 'ngRoute'])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/fitness',
        template: '<b>TESTING</b>'
      .otherwise
        template: '<b>TESTING</b>'

    $locationProvider.html5Mode(true)
