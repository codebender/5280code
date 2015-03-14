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


    $scope.setTimeFrame = (time_frame) ->
      $scope.time_frame = time_frame
      $scope.getTimeSeriesData()

    $scope.getTimeSeriesData = ->
      Fitbit.sleep_time_series_data($scope.time_frame).then (fitbit_data) ->
        $scope.sleep_time_series = fitbit_data

      Fitbit.activity_time_series_data($scope.time_frame).then (fitbit_data) ->
        $scope.activity_time_series = fitbit_data

    $scope.time_frame = '1w'

    $scope.getTimeSeriesData()
