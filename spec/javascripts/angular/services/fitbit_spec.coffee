describe 'Fitbit', ->
  fitbit = http = null

  beforeEach module 'resources.fitbit'
  beforeEach inject (Fitbit, _$httpBackend_) ->
    fitbit = Fitbit
    http = _$httpBackend_

  describe '#user_info', ->
    it 'should GET the local fitbit api and return a promise', ->
      http.expectGET('/api/fitbit/user_info').respond({})
      expect(typeof fitbit.user_info().then).toBe('function')
      http.flush()

  describe '#device_info', ->
    it 'should GET the local fitbit api and return a promise', ->
      http.expectGET('/api/fitbit/device_info').respond({})
      expect(typeof fitbit.device_info().then).toBe('function')
      http.flush()

  describe '#sleep_data', ->
    it 'should GET the local fitbit api and return a promise', ->
      http.expectGET('/api/fitbit/sleep_data').respond({})
      expect(typeof fitbit.sleep_data().then).toBe('function')
      http.flush()

  describe '#activity_data', ->
    it 'should GET the local fitbit api and return a promise', ->
      http.expectGET('/api/fitbit/activity_data').respond({})
      expect(typeof fitbit.activity_data().then).toBe('function')
      http.flush()
