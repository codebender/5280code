describe 'Coderwall', ->
  coderwall = http = null

  beforeEach module 'resources.coderwall'
  beforeEach inject (Coderwall, _$httpBackend_) ->
    coderwall = Coderwall
    http = _$httpBackend_

  describe '#get_badges', ->
    it 'should GET coderwall api and return a promise', ->
      http.expectJSONP(coderwall.api_url).respond({})
      expect(typeof coderwall.get_badges('test_user').then).toBe('function')
      http.flush()
