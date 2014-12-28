require 'spec_helper'

describe 'Blog Posts API' do
  let(:fake_blog_post) { BlogPost.new(
    Pathname.new('2014-12-27-test-blog.md')) }
  let(:blog_post_markdown) {
<<-EOF
---
title:  'Yet Another Tech Blog'
created_at: '2014-12-27'
---

Test Blog paragraph
EOF
  }

  before(:each) do
    allow(File).to receive(:read).and_return(blog_post_markdown)
    allow(YAML).to receive(:load_file).and_return(YAML.load(blog_post_markdown))
  end

  describe 'GET index' do
    it 'returns a list of the latest blog posts' do
      expect(BlogPost).to receive(:all).
        and_return([ fake_blog_post, fake_blog_post ])

      get "/api/blog_posts"

      expect(response).to be_success
      expect(json['blog_posts'].count).to eql 2
      expect(json['blog_posts'].first['id']).to eql fake_blog_post.id
      expect(json['blog_posts'].last['id']).to eql fake_blog_post.id
    end
  end

  describe 'GET show' do
    it 'returns the requested blog post' do
      expect(BlogPost).to receive(:find).with(fake_blog_post.id).
        and_return(fake_blog_post)

      get "/api/blog_posts/#{fake_blog_post.id}"

      expect(response).to be_success
      expect(json['id']).to eql fake_blog_post.id
    end

    it 'returns an error if the blog post requested is not found' do
      get '/api/blog_posts/not-a-real-post'

      expect(response.status).to eql 404
    end
  end
end
