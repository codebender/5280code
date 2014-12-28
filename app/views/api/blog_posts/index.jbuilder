json.blog_posts do
  json.partial! 'blog_post', collection: @blog_posts, as: :blog_post
end
