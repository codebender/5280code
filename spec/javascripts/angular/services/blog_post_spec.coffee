describe 'Blog Post Service', ->
  blogPost = http = null

  beforeEach module 'resources.blog_post'
  beforeEach inject (BlogPost, _$httpBackend_) ->
    blogPost = BlogPost
    http = _$httpBackend_

  describe '#query', ->
    it 'should GET all the availability schedules', ->
      http.expectGET('/api/blog_posts').respond([])
      expect(typeof blogPost.query().$promise.then).toBe('function')
      http.flush()

  describe '#get', ->
    it 'should GET the secified availability schedules', ->
      http.expectGET('/api/blog_posts/123').respond({})
      expect(typeof blogPost.get(id: 123).$promise.then).toBe('function')
      http.flush()
