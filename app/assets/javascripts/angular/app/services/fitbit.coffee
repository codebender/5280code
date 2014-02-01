angular.module('resources.fitbit', [])
  .factory 'Fitbit', ($q, $http) ->
    user_info: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/user_info')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    device_info: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/device_info')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    sleep_data: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/sleep_data')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    activity_data: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/activity_data')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise
