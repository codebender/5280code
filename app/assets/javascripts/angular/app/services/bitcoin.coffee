angular.module('resources.bitcoin', ['ngResource'])
  .factory 'Bitcoin', ($q, $http) ->
    apiURL: 'http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast'
    latest_price: ->
      deferred = $q.defer()
      $http.get(@apiURL)
        .success (response) =>
          deferred.resolve(response)
      deferred.promise
  .factory 'BitcoinSocket', ($rootScope) ->
    pubnub_setup = {
      channel       : 'd5f06780-30a8-4a48-a2f8-7ed181b4a13f'
      presence      : false
      publish_key   : 'pub-c-c3129a39-186f-4106-8d25-6804d033db12'
      subscribe_key : 'sub-c-50d56e1e-2fd9-11e3-a041-02ee2ddab7fe'
    }
    socket = io.connect('http://pubsub.pubnub.com', pubnub_setup)
    on: (eventName, callback) ->
      socket.on eventName, ->
        console.log eventName
        args = arguments
        $rootScope.$apply ->
          callback.apply socket, args
