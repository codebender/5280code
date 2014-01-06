describe 'Bitcoin Controller', ->
  $scope = $location = rootScope = null

  pubnubStub = jasmine.createSpyObj('PubNub', ['init',
                                               'ngSubscribe',
                                               'ngMsgEv',
                                               'ngHistory',
                                               'ngUnsubscribe',
                                               'destroy'])
  beforeEach module 'app.controllers.bitcoin'

  beforeEach inject ($rootScope, $controller, _$location_) ->
    $scope = $rootScope.$new()
    rootScope = $rootScope
    $location = _$location_
    $controller 'bitcoinCtrl',
      $scope: $scope
      PubNub: pubnubStub

  it 'initializes PubNub with the subscribe_key', ->
    expect(pubnubStub.init).toHaveBeenCalledWith(
      subscribe_key : 'sub-c-50d56e1e-2fd9-11e3-a041-02ee2ddab7fe')

  it 'subscribes to the PubNub channel', ->
    expect(pubnubStub.ngSubscribe).toHaveBeenCalledWith(
      channel : 'd5f06780-30a8-4a48-a2f8-7ed181b4a13f')

  it 'requests the PubNub channel history', ->
    expect(pubnubStub.ngHistory).toHaveBeenCalledWith(
      channel : 'd5f06780-30a8-4a48-a2f8-7ed181b4a13f',
      count   : 1)

  it 'unsubscribes the PubNub channel and destroys the instance', ->
    $location.path('/')
    rootScope.$digest()
    expect(pubnubStub.ngUnsubscribe).toHaveBeenCalledWith(
      channel : 'd5f06780-30a8-4a48-a2f8-7ed181b4a13f')
    expect(pubnubStub.destroy).toHaveBeenCalled()
