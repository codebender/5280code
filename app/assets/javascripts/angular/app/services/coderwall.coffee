angular.module('resources.coderwall', [])
  .factory 'Coderwall', ($q, $http) ->
    apiURL: (username) ->
      "https://coderwall.com/#{username}.json?callback=JSON_CALLBACK"
    get_badges: (username) ->
      deferred = $q.defer()
      $http.jsonp(@apiURL(username))
        .success (response) ->
          deferred.resolve(response.data)
      deferred.promise
