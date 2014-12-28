class BlogPost
  include ActiveModel::Model

  BLOG_ROOT = Rails.root.join("app", "blog").freeze

  class BlogPostNotFound < StandardError
  end

  attr_reader :id, :path

  class << self

    def all
      BLOG_ROOT.entries.
        reject(&:directory?).
        reverse.
        map { |file| BlogPost.new(file) }
    end

    def latest
      all.first
    end

    def find(id)
      post = BlogPost.all.find { |post| post.id == id }

      unless post
        raise BlogPostNotFound
      end
      post
    end

  end

  def initialize(pathname)
    @id = id_of(pathname)
    @path = BLOG_ROOT.join(pathname)
  end

  def title
    meta_data[:title]
  end

  def body
    meta_data[:body]
  end

  def created_at
    meta_data[:created_at]
  end

  def to_html
    extensions = {
      fenced_code_blocks: true,
      strikethrough: true,
      autolink: true
    }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions).
      render(remove_yaml_metadata(body))
  end

  private

  def id_of(pathname)
    pathname.basename.to_s.sub(pathname.extname, "")
  end

  def meta_data
    @data ||= {
      body: File.read(path),
      permalink: File.basename(path, '.*')
    }.merge(yaml_metadata).with_indifferent_access

  end

  def yaml_metadata
    YAML.load_file(path)
  end

  def remove_yaml_metadata(body)
    body.sub(/^\s*---(.*?)---\s/m, "")
  end

end
