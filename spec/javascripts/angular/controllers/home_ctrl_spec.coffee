describe 'Home Contrller', ->
  $scope = mockBlogPost = null

  blogPostsResponse = [
    {
      "id": "2014-12-27-yet-another-blog",
      "title": "Yet Another Tech Blog",
      "author": "Matthew Bender",
      "created_at": "2014-12-27"
    },
    {
      "id": "2014-12-25-merry-christmas",
      "title": "Merry Chirstmas y'all",
      "author": "Matthew Bender",
      "created_at": "2014-12-25"
    }
  ]

  beforeEach ->
    module 'app.controllers.home'

    inject ($rootScope, $controller) ->
      mockBlogPost = jasmine.createSpyObj('BlogPost', ['query'])
      mockBlogPost.query.andCallFake -> $promise:
        then: (callback) ->
          callback(blogPostsResponse)

      $scope = $rootScope.$new()
      $controller 'homeCtrl',
        $scope: $scope
        BlogPost: mockBlogPost

  describe 'initialization', ->
    it 'loads a list of recent blogs', ->
      expect(mockBlogPost.query).toHaveBeenCalled()

    it 'sets the blog_posts scope variable', ->
      expect($scope.blog_posts).toEqual(blogPostsResponse)
