json.extract! blog, :id, :title, :teaser, :body, :cta, :category, :linked_module, :published, :published_on, :user_id, :image, :pdf, :created_at, :updated_at
json.url blog_url(blog, format: :json)
