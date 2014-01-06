angular.module('app.controllers.home', ['resources.bitcoin'])
  .controller 'homeCtrl', ($scope, Bitcoin) ->
    $scope.message = 'Welcome home Mr. Bender!'

    Bitcoin.latest_price().then (btc_data) ->
      $scope.bitcoin_price = btc_data.data.last.display
