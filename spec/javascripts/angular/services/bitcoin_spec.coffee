describe 'Bitcoin', ->
  bitcoin = http = null

  beforeEach module 'resources.bitcoin'
  beforeEach inject (Bitcoin, _$httpBackend_) ->
    bitcoin = Bitcoin
    http = _$httpBackend_

  describe '#latest_price', ->
    it 'should GET bitcoin api and return a promise', ->
      http.expectGET(bitcoin.api_url).respond({})
      expect(typeof bitcoin.latest_price().then).toBe('function')
      http.flush()
