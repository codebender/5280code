class Api::BlogPostsController < Api::BaseController

  def index
    @blog_posts = all_blogs
  end

  def show
    @blog_post = find_blog(params[:id])
  end

  private

  def all_blogs
    Rails.cache.fetch('all_blog_posts', expires: 1.hour) do
      BlogPost.all
    end
  end

  def find_blog(id)
    Rails.cache.fetch(['blog_post', id], expires: 1.hour) do
      BlogPost.find(id)
    end
  end
end
