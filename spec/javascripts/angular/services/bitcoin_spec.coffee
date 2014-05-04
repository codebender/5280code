describe 'Bitcoin', ->
  bitcoin = http = null

  beforeEach module 'resources.bitcoin'
  beforeEach inject (Bitcoin, _$httpBackend_) ->
    bitcoin = Bitcoin
    http = _$httpBackend_

  describe '#user_info', ->
    it 'should GET the bitstamp ticker', ->
      http.expectGET('/api/bitcoin/ticker').respond({})
      expect(typeof bitcoin.ticker().then).toBe('function')
      http.flush()
