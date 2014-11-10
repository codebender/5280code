angular.module('app.controllers.meetup', ['resources.meetup'])
  .controller 'meetupCtrl', ($scope, Meetup) ->
    Meetup.events().then (event_data) ->
      $scope.events = event_data.results
