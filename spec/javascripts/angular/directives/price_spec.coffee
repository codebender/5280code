describe 'price directive', ->
  scope = element = null

  beforeEach module 'app.directives.price'

  beforeEach inject ($rootScope, $compile) ->
    scope = $rootScope.$new()
    element = angular.element('<price current="10"></price>')
    $compile(element)(scope)

  it 'adds increase class if the price increases', ->
    scope.$digest()
    element.isolateScope().current = '11'
    scope.$digest()
    expect(element.hasClass('increase')).toBe true

  it 'add decrease class if the price decreases', ->
    scope.$digest()
    element.isolateScope().current = '9'
    scope.$digest()
    expect(element.hasClass('decrease')).toBe true
