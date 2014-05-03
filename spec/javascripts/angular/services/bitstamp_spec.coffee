describe 'Bitstamp', ->
  bitstamp = http = null

  beforeEach module 'resources.bitstamp'
  beforeEach inject (Bitstamp, _$httpBackend_) ->
    bitstamp = Bitstamp
    http = _$httpBackend_

  describe '#user_info', ->
    it 'should GET the bitstamp ticker', ->
      http.expectGET('https://www.bitstamp.net/api/ticker/').respond({})
      expect(typeof bitstamp.ticker().then).toBe('function')
      http.flush()
