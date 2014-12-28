require 'spec_helper'

RSpec.describe BlogPost, type: :model do
  let(:fake_blog_root) { double(Pathname) }

  before(:each) do
    stub_const('BlogPost::BLOG_ROOT', fake_blog_root)
    allow(fake_blog_root).to receive(:join).and_return('')
  end

  context 'Class Methods' do
    before(:each) do
      allow(fake_blog_root).to receive(:entries).and_return(
      [ Pathname.new('.'),
        Pathname.new('..'),
        Pathname.new('2012-12-27-old-test-blog.md'),
        Pathname.new('2014-12-27-test-blog.md') ]
        )
    end

    describe 'all' do
      it 'returns all the blog post from the blog directory' do
        expect(BlogPost.all.map(&:id)).to include('2014-12-27-test-blog',
          '2012-12-27-old-test-blog')
      end

      it 'returns the blog posts in reverse chronological order' do
        expect(BlogPost.all.first.id).to eq '2014-12-27-test-blog'
      end
    end

    describe 'latest' do
      it 'returns the most recent blog' do
        expect(BlogPost.latest.id).to eq '2014-12-27-test-blog'
      end
    end

    describe 'find' do
      it 'returns the blog post with the given permalink name' do
        expect(BlogPost.find('2014-12-27-test-blog')).to be_a(BlogPost)
      end

      it 'raises an exception if the blog post is not found' do
        expect { BlogPost.find('fake-unfound-blog-post') }.to raise_error
      end
    end
  end

  context 'instance methods' do
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
      allow(YAML).to receive(:load_file).
        and_return(YAML.load(blog_post_markdown))
    end

    describe 'body' do
      it 'returns the blog post body' do
        expect(fake_blog_post.body).to include("Test Blog paragraph")
      end
    end

    describe 'title' do
      it 'returns the title from the yml in the md file' do
        expect(fake_blog_post.title).to eql 'Yet Another Tech Blog'
      end
    end

    describe 'created_at' do
      it 'returns the created_at field from the yml in the md file' do
        expect(fake_blog_post.created_at).to eql '2014-12-27'
      end
    end

    describe 'to_html' do
      it 'removes the yml meta data' do
        expect(fake_blog_post.to_html).not_to include('Yet Another Tech Blog')
      end

      it 'converts the markdown to html' do
        expect(fake_blog_post.to_html).to include("<p>Test Blog paragraph</p>")
      end
    end
  end
end
