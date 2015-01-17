angular.module('app.controllers.blog_post', ['resources.blog_post'])
  .controller 'blogPostCtrl', ($scope, BlogPost, $routeParams, $sce, $location) ->
    BlogPost.get($routeParams.id).success (response) ->
      $scope.blog_post = response
      $scope.tweet =
        via: '5280code'
        text: $scope.blog_post.title + ' :: ' + $scope.blog_post.author
        url: $location.absUrl()
