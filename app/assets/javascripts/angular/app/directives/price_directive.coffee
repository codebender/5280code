angular.module('app.directives.price', [])
  .directive 'price', ($timeout) ->
    linker = (scope, element, attrs) ->
      scope.$watch 'current', (newPrice, oldPrice) ->
        return if oldPrice == newPrice || !oldPrice
        element.removeClass('increase').val()
        element.removeClass('decrease').val()
        $timeout ->
          if parseFloat(oldPrice) < parseFloat(newPrice)
            element.addClass('increase')
          else
            element.addClass('decrease')
        , 1
    scope:
      current: '@'
    restrict: 'E',
    template: '<span class="label label-default"><strong>$</strong>{{current | number:2}}</span>',
    link: linker,
    replace: true
