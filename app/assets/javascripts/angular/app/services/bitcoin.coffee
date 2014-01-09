angular.module('resources.bitcoin', [])
  .factory 'Bitcoin', ($q, $http) ->
    apiURL: 'http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast'
    latest_price: ->
      deferred = $q.defer()
      $http.get(@apiURL)
        .success (response) =>
          deferred.resolve(response)
      deferred.promise
