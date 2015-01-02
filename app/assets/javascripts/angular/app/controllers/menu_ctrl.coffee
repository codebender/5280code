angular.module('app.controllers.menu', [])
  .controller 'menuCtrl', ($scope, $location) ->
    $scope.is_active = (route) ->
      route == $location.path()
