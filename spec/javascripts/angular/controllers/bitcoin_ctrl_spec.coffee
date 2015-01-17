describe 'Bitcoin Controller', ->
  $scope = $location = rootScope = null

  tickerResponse = {"high": "455.78", "last": "437.01",
  "timestamp": "1399149858", "bid": "436.77", "vwap": "442.15",
  "volume": "7667.02426861", "low": "431.00", "ask": "437.01"}

  pusherStub = jasmine.createSpyObj('Pusher', ['subscribe',
                                             'unsubscribe'])

  bitcoinStub = jasmine.createSpyObj('Bitcoin', ['ticker'])
  bitcoinStub.ticker.and.callFake -> success: (api_data) ->
    api_data(tickerResponse)

  beforeEach module 'app.controllers.bitcoin'

  beforeEach inject ($rootScope, $controller, _$location_) ->
    $scope = $rootScope.$new()
    rootScope = $rootScope
    $location = _$location_
    $controller 'bitcoinCtrl',
      $scope: $scope
      Pusher: pusherStub
      Bitcoin: bitcoinStub

  it 'subscribes to the Bitstamp channel', ->
    expect(pusherStub.subscribe).toHaveBeenCalledWith(
      'live_trades', 'trade', jasmine.any(Function))

  it 'unsubscribes the Bitstamp channel and destroys the instance', ->
    $location.path('/')
    rootScope.$digest()
    expect(pusherStub.unsubscribe).toHaveBeenCalledWith('live_trades')

  it 'gets the latest bitstamp trade info', ->
    expect($scope.bitcoin_ticker.last_traded_at).toEqual(tickerResponse.timestamp*1000)
    expect($scope.bitcoin_ticker.price).toEqual(tickerResponse.last)
    expect($scope.bitcoin_ticker.high).toEqual(tickerResponse.high)
    expect($scope.bitcoin_ticker.low).toEqual(tickerResponse.low)
