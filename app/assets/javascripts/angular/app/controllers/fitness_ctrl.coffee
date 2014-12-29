angular.module('app.controllers.fitness', ['resources.fitbit'])
  .controller 'fitnessCtrl', ($scope, Fitbit) ->
    Fitbit.user_info().then (fitbit_data) ->
      $scope.user = fitbit_data

    Fitbit.device_info().then (fitbit_data) ->
      $scope.device = fitbit_data

    Fitbit.activity_data().then (fitbit_data) ->
      $scope.activity = fitbit_data

    Fitbit.sleep_data().then (fitbit_data) ->
      $scope.sleep = fitbit_data
