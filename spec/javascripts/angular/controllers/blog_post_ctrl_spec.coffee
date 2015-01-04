describe 'Blog Post Controller', ->
  $scope = routeParams = mockBlogPost = null

  blogPostResponse = {
    "id": "2014-12-27-yet-another-blog",
    "title": "Yet Another Tech Blog",
    "author": "Matthew Bender",
    "created_at": "2014-12-27",
    "html": "<h1>The Title is here</h1><p>just a test ....</p>"
  }

  beforeEach ->
    module 'app.controllers.blog_post'

    inject ($rootScope, $controller) ->
      $scope = $rootScope.$new()
      mockLocation = jasmine.createSpyObj('$location', ['absUrl'])
      mockLocation.absUrl.andCallFake ->
        "http://localhost/blogs/2014-12-27-yet-another-blog"

      mockBlogPost = jasmine.createSpyObj('BlogPost', ['get'])
      mockBlogPost.get.andCallFake -> $promise:
        then: (callback) ->
          callback(blogPostResponse)

      $controller 'blogPostCtrl',
        $scope: $scope
        $routeParams: { id: '2014-12-27-yet-another-blog' }
        BlogPost: mockBlogPost
        $location: mockLocation

  describe 'initialization', ->
    it 'calls the api with the id from route param', ->
      expect(mockBlogPost.get).toHaveBeenCalledWith(
        { id: '2014-12-27-yet-another-blog' } )

    it 'sets the blog_post scope variable', ->
      expect($scope.blog_post).toEqual(blogPostResponse)

    it 'sets the tweet object for twitter sharing', ->
      expect($scope.tweet.url).toEqual('http://localhost/blogs/2014-12-27-yet-another-blog')
      expect($scope.tweet.via).toEqual('5280code')
      expect($scope.tweet.text).toEqual('Yet Another Tech Blog :: Matthew Bender')
