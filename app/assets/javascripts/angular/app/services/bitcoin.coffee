angular.module('resources.bitcoin', [])
  .factory 'Bitcoin', ($q, $http) ->
    ticker: ->
      deferred = $q.defer()
      $http.get("/api/bitcoin/ticker")
        .success (response) ->
          response.data
