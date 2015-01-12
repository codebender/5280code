describe 'Coderwall Controller', ->
  $scope = coderwallStub = null

  coderwall_response = {"username":"testuser","name":"Test","location":"Denver, CO","endorsements":4,"team":"12345677","accounts":{"github":"codebender"},"badges":[{"name":"Walrus","description":"The walrus is no stranger to variety. Use at least 4 different languages throughout all your repos","created":"2013-12-10T17:47:11Z","badge":"https://d3levm2kxut31z.cloudfront.net/assets/badges/walrus-a0bb4ddb2394171b632edc953930518d.png"},{"name":"Mongoose","description":"Have at least one original repo where Ruby is the dominant language","created":"2013-12-10T17:47:10Z","badge":"https://d3levm2kxut31z.cloudfront.net/assets/badges/mongoose-e0e4cbd12d67a2c7ff946cce1fda8881.png"},{"name":"Charity","description":"Fork and commit to someone's open source project in need","created":"2013-01-20T19:19:52Z","badge":"https://d3levm2kxut31z.cloudfront.net/assets/badges/charity-6c70c329d56fa13fcab3f07b26f0b178.png"}]}

  beforeEach module 'app.controllers.coderwall'

  beforeEach inject ($rootScope, $controller) ->
    $scope = $rootScope.$new()
    coderwallStub = jasmine.createSpyObj('Coderwall', ['get_badges'])
    coderwallStub.get_badges.and.callFake -> then: (data) ->
      data(coderwall_response)

    $controller 'coderwallCtrl',
      $scope: $scope,
      Coderwall: coderwallStub

  describe '#badges', ->
    it 'calls the the api with the correct username', ->
      expect(coderwallStub.get_badges).toHaveBeenCalledWith('codebender')
    it 'loads coderwall badges api data into scope', ->
      expect($scope.badges).toEqual coderwall_response.badges
