angular.module('app.controllers.home', ['resources.blog_post'])
  .controller 'homeCtrl', ($scope, BlogPost) ->
    BlogPost.query().success (response) ->
      $scope.blog_posts = response
