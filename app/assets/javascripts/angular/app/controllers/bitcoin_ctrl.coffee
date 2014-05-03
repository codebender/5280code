angular.module('app.controllers.bitcoin', ['resources.bitstamp','doowb.angular-pusher'])
  .controller 'bitcoinCtrl', ($rootScope, $scope, Pusher, Bitstamp) ->
    trade_channel = 'live_trades'

    $scope.bitcoin_ticker = {}

    Pusher.subscribe trade_channel, 'trade', (trade) ->
      $scope.bitcoin_ticker.last_traded_at = new Date()
      $scope.bitcoin_ticker.price = trade.price

    $scope.$on '$locationChangeStart', (event, next, current) ->
      Pusher.unsubscribe trade_channel

    Bitstamp.ticker().success (data) ->
      $scope.bitcoin_ticker.last_traded_at = data.timestamp*1000
      $scope.bitcoin_ticker.price = data.last
      $scope.bitcoin_ticker.high = data.high
      $scope.bitcoin_ticker.low = data.low
