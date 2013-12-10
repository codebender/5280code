angular.module('app.directives.price', [])
  .directive 'price', ->
    linker = (scope, element, attrs) ->
      scope.$watch 'current', (newPrice, oldPrice) ->
        return if oldPrice == newPrice || !oldPrice
        element.removeClass('increase').width()
        element.removeClass('decrease').width()
        if parseFloat(oldPrice) < parseFloat(newPrice)
          element.addClass('increase')
        else
          element.addClass('decrease')
    scope:
      current: '@'
    restrict: 'E',
    template: '<span class="label label-default"><strong>$</strong>{{current | number:2}}</span>',
    link: linker,
    replace: true
