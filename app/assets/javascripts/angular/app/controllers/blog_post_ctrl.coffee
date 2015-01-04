angular.module('app.controllers.blog_post', ['resources.blog_post'])
  .controller 'blogPostCtrl', ($scope, BlogPost, $routeParams, $sce, $location) ->
    BlogPost.get({ id: $routeParams.id }).$promise.then (data) ->
      $scope.blog_post = data
      $scope.tweet =
        via: '5280code'
        text: data.title + ' :: ' + data.author
        url: $location.absUrl()
