angular.module('app.controllers.coderwall', ['resources.coderwall'])
  .controller 'coderwallCtrl', ($scope, Coderwall) ->
    $scope.username = 'misterbender'
    $scope.badges = []
    Coderwall.get_badges($scope.username).then (data) ->
      $scope.badges = data.badges
