describe 'Menu Controller', ->
  $scope = $location = controllerInstance = null

  beforeEach module 'app.controllers.menu'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    controllerInstance = $controller 'menuCtrl',
      $scope: $scope

  describe '#is_active', ->
    beforeEach inject (_$location_) ->
      $location = _$location_

    it 'returns true if the $location path is equal to the passed param', ->
      $location.$$path = '/match'
      expect($scope.is_active('/match')).toEqual true

    it 'returns false if the $location path is not equal to the passed param', ->
      $location.$$path = '/match'
      expect($scope.is_active('/test')).toEqual false
