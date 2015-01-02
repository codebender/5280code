angular.module('resources.blog_post', ['ngResource'])
  .factory 'BlogPost', ($resource) ->
    $resource '/api/blog_posts/:id'
