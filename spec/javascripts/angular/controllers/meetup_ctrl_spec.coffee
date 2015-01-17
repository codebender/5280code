describe 'Meetup Contrller', ->
  $scope = null
  eventsResponse = { results: [ {name: 'event1' }, {name: 'event2'} ] }

  meetupStub = jasmine.createSpyObj('Meetup', ['events'])
  meetupStub.events.and.callFake -> then: (api_data) ->
    api_data(eventsResponse)

  beforeEach module 'app.controllers.meetup'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    $controller 'meetupCtrl',
      $scope: $scope
      Meetup: meetupStub

  it 'loads latest meetup api events data into scope', ->
    expect($scope.events).toEqual eventsResponse.results
