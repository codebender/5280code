describe 'Fitness Contrller', ->
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

  fitbitStub = jasmine.createSpyObj('Fitbit', ['user_info',
    'device_info', 'sleep_data', 'activity_data'])
  fitbitStub.user_info.and.callFake -> then: (api_data) ->
    api_data(userResponse)
  fitbitStub.device_info.and.callFake -> then: (api_data) ->
    api_data(deviceResponse)
  fitbitStub.sleep_data.and.callFake -> then: (api_data) ->
    api_data(sleepResponse)
  fitbitStub.activity_data.and.callFake -> then: (api_data) ->
    api_data(activityResponse)

  beforeEach module 'app.controllers.fitness'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    $controller 'fitnessCtrl',
      $scope: $scope
      Fitbit: fitbitStub

  it 'loads latest fitbit api user data into scope', ->
    expect($scope.user).toEqual userResponse

  it 'loads latest fitbit api device data into scope', ->
    expect($scope.device).toEqual deviceResponse

  it 'loads latest fitbit api sleep data into scope', ->
    expect($scope.sleep).toEqual sleepResponse

  it 'loads latest fitbit api activity data into scope', ->
    expect($scope.activity).toEqual activityResponse
