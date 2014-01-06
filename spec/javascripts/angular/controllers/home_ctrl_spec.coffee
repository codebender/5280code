describe 'Home Contrller', ->
  $scope = null
  bitcoinAPIResponse = {"data":{"last":{"display":"$846.00"}}}

  bitcoinStub = jasmine.createSpyObj('Bitcoin', ['latest_price'])
  bitcoinStub.latest_price.andCallFake -> then: (btc_data) ->
    btc_data(bitcoinAPIResponse)

  beforeEach module 'app.controllers.home'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    $controller 'homeCtrl',
      $scope: $scope
      Bitcoin: bitcoinStub

  describe '#bitcoin_price', ->
    it 'loads latest bitcoin api data into scope', ->
      expect($scope.bitcoin_price).toEqual '$846.00'
