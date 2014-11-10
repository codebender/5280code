angular.module('resources.meetup', [])
  .factory 'Meetup', ($q, $http) ->
    events: ->
      deferred = $q.defer()
      $http.get('/api/meetups')
        .success (response) =>
          deferred.resolve(response)
      deferred.promise
