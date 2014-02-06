angular.module('resources.fitbit', [])
  .factory 'Fitbit', ($q, $http) ->
    user_info: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/user')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    device_info: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/device')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    sleep_data: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/sleep')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise

    activity_data: ->
      deferred = $q.defer()
      $http.get('/api/fitbit/activity')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise
