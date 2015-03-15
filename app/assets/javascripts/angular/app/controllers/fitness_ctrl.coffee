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

    $scope.stepChartConfig =
      data:
        x: 'dateTime'
        xFormat: '%Y-%m-%d',
        json: []
        keys:
          x: 'dateTime'
          value: ['value']
        type: 'spline'
        names:
          value: 'Steps'
      axis:
        x:
          type: 'timeseries'
          tick:
            format: '%m/%d'
        y:
          min: 0
          padding: {bottom:0}
      grid:
        y:
          lines: [{value: 10000, text: 'Daily Goal'}]

    $scope.sleepChartConfig =
      data:
        x: 'dateTime'
        xFormat: '%Y-%m-%d',
        json: []
        keys:
          x: 'dateTime'
          value: ['value']
        type: 'spline'
        names:
          value: 'Minutes Asleep'
      axis:
        x:
          type: 'timeseries'
          tick:
            format: '%m/%d'
        y:
          min: 0
          padding: {bottom:0}
      grid:
        y:
          lines: [{value: 420, text: 'Daily Goal'}]

    $scope.getTimeSeriesData = ->
      Fitbit.activity_time_series_data($scope.time_frame).then (fitbit_data) ->
        $scope.stepChartConfig.data.json = fitbit_data['activities-tracker-steps']

      Fitbit.sleep_time_series_data($scope.time_frame).then (fitbit_data) ->
        $scope.sleepChartConfig.data.json = fitbit_data['sleep-minutesAsleep']



    $scope.setTimeFrame('1w')
