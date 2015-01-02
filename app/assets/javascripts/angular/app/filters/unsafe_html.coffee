angular.module('app.filters.unsafe_html', [])
  .filter 'unsafeHtml', ($sce) ->
    $sce.trustAsHtml
