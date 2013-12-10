angular.module('app.controllers.bitcoin', [])
  .controller 'bitcoinCtrl', ($rootScope, $scope, PubNub) ->
    ticker_channel = 'd5f06780-30a8-4a48-a2f8-7ed181b4a13f'
    $scope.bitcoin_ticker = null

    PubNub.init
      subscribe_key : 'sub-c-50d56e1e-2fd9-11e3-a041-02ee2ddab7fe'

    PubNub.ngSubscribe
      channel : ticker_channel

    $rootScope.$on PubNub.ngMsgEv(ticker_channel), (ngEvent, payload) ->
      $scope.$apply ->
        $scope.bitcoin_ticker = payload.message.ticker

    PubNub.ngHistory
      channel : ticker_channel
      count   : 1

    $scope.$on '$locationChangeStart', (event, next, current) ->
      PubNub.ngUnsubscribe channel : ticker_channel
      PubNub.destroy()
