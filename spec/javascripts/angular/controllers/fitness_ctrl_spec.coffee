describe 'Fitness Controller', ->
  $scope = null
  userResponse = {"member_since":"2012-12-13",
  "avatar_url":"https://cloudfront.net/50_square.jpg",
  "city":"Denver","state":"CO","height":80,
  "weight":160}
  deviceResponse = {"last_sync_time":"2014-02-01T13:13:07-07:00",
  "battery_level":"Medium","device_type":"Flex"}
  sleepResponse = {"minutes_asleep":504,"minutes_in_bed":544,
  "minutes_to_fall_asleep":10,"efficiency":94}
  activityResponse = {"steps":1715,"distance":0.8,
  "calories_out":1351,"active_calories":317,"active_minutes":89}
  tsActivityResponse = {
    "2015-03-07": "10418",
    "2015-03-08": "19844",
    "2015-03-09": "15061",
    "2015-03-10": "10289",
    "2015-03-11": "13754",
    "2015-03-12": "11606",
    "2015-03-13": "9134" }
  tsSleepResponse = {
    "2015-03-07": "0",
    "2015-03-08": "414",
    "2015-03-09": "462",
    "2015-03-10": "378",
    "2015-03-11": "501",
    "2015-03-12": "358",
    "2015-03-13": "380"
  }

  fitbitStub = jasmine.createSpyObj('Fitbit', ['user_info',
    'device_info', 'sleep_data', 'activity_data', 'sleep_time_series_data',
    'activity_time_series_data'])
  fitbitStub.user_info.and.callFake -> then: (api_data) ->
    api_data(userResponse)
  fitbitStub.device_info.and.callFake -> then: (api_data) ->
    api_data(deviceResponse)
  fitbitStub.sleep_data.and.callFake -> then: (api_data) ->
    api_data(sleepResponse)
  fitbitStub.activity_data.and.callFake -> then: (api_data) ->
    api_data(activityResponse)
  fitbitStub.sleep_time_series_data.and.callFake -> then: (api_data) ->
    api_data(tsSleepResponse)
  fitbitStub.activity_time_series_data.and.callFake -> then: (api_data) ->
    api_data(tsActivityResponse)

  beforeEach module 'app.controllers.fitness'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    $controller 'fitnessCtrl',
      $scope: $scope
      Fitbit: fitbitStub

  describe 'initialization', ->
    it 'loads latest fitbit api user data into scope', ->
      expect($scope.user).toEqual userResponse

    it 'loads latest fitbit api device data into scope', ->
      expect($scope.device).toEqual deviceResponse

    it 'loads latest fitbit api sleep data into scope', ->
      expect($scope.sleep).toEqual sleepResponse

    it 'loads latest fitbit api activity data into scope', ->
      expect($scope.activity).toEqual activityResponse

    it 'loads latest fitbit api activity time series data into scope', ->
      expect($scope.activity_time_series).toEqual tsActivityResponse

    it 'loads latest fitbit api sleep time series data into scope', ->
      expect($scope.sleep_time_series).toEqual tsSleepResponse

    it 'defaults the time series data to 1 week', ->
      expect(fitbitStub.activity_time_series_data).toHaveBeenCalledWith('1w')
      expect(fitbitStub.sleep_time_series_data).toHaveBeenCalledWith('1w')

  describe '#setTimeFrame', ->
    it 'sets the time frame', ->
      $scope.setTimeFrame('123')
      expect($scope.time_frame).toEqual('123')

    it 'get the data for the new time frame', ->
      $scope.setTimeFrame('1m')
      expect(fitbitStub.activity_time_series_data).toHaveBeenCalledWith('1m')
      expect(fitbitStub.sleep_time_series_data).toHaveBeenCalledWith('1m')

  describe '#getTimeSeriesData', ->
    beforeEach ->
      $scope.time_frame = '1y'

    it 'retrieves the activity time series data with the current time frame', ->
      $scope.getTimeSeriesData()
      expect(fitbitStub.activity_time_series_data).toHaveBeenCalledWith('1y')
    it 'retrieves the activity time series data with the current time frame', ->
      $scope.getTimeSeriesData()
      expect(fitbitStub.sleep_time_series_data).toHaveBeenCalledWith('1y')
