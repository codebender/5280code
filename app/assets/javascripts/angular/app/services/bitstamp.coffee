angular.module('resources.bitstamp', [])
  .factory 'Bitstamp', ($q, $http) ->
    ticker: ->
      deferred = $q.defer()
      $http.get("https://www.bitstamp.net/api/ticker/")
        .success (response) ->
          response.data
