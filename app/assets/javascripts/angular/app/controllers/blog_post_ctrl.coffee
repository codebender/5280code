angular.module('app.controllers.blog_post', ['resources.blog_post'])
  .controller 'blogPostCtrl', ($scope, BlogPost, $routeParams, $sce, $location) ->
    BlogPost.get({ id: $routeParams.id }).$promise.then (data) ->
      $scope.blog_post = data

    $scope.tweetUrl = $location.absUrl()
