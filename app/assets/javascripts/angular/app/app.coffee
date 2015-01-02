angular.module('appControllers',
['app.controllers.menu'
 'app.controllers.home'
 'app.controllers.bitcoin'
 'app.controllers.fitness'
 'app.controllers.coderwall',
 'app.controllers.meetup',
 'app.controllers.blog_post'
])

angular.module('appDirectives',
['app.directives.price'
])

angular.module('appFilters',
['app.filters.minutes_to_hours'
])

angular.module('app', ['appControllers', 'appDirectives', 'appFilters',
'ngRoute', 'ui.bootstrap', 'doowb.angular-pusher'])
  .config ($routeProvider, $locationProvider, PusherServiceProvider) ->
    $routeProvider
      .when '/',
        template: JST['angular/app/templates/home']
      .when '/fitness',
        template: JST['angular/app/templates/fitness']
      .when '/meetups',
        template: JST['angular/app/templates/meetups']
      .when '/bitcoin',
        template: JST['angular/app/templates/bitcoin']
      .when '/blog_posts/:id',
        template: JST['angular/app/templates/blog_post']
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode(
      enabled: true,
      requireBase: false
    )

    PusherServiceProvider
      .setToken('de504dc5763aeef9ff52')
      .setOptions({})
