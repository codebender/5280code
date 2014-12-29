angular.module('app.controllers.home', ['resources.blog_post'])
  .controller 'homeCtrl', ($scope, BlogPost) ->
    BlogPost.query().$promise.then (data) ->
      $scope.blog_posts = data
