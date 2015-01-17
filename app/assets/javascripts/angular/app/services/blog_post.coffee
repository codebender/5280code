angular.module('resources.blog_post', [])
  .factory 'BlogPost', ($q, $http) ->
    query: ->
      deferred = $q.defer()
      $http.get("/api/blog_posts")
        .success (response) ->
          response.data

    get: (id)->
      deferred = $q.defer()
      $http.get("/api/blog_posts/#{id}")
        .success (response) ->
          response.data
