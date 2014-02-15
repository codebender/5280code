describe 'Home Contrller', ->
  $scope = null

  beforeEach module 'app.controllers.home'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    $controller 'homeCtrl',
      $scope: $scope
