json.extract! contribution, :id, :name, :email, :category, :idea, :prev_published, :terms, :comments, :responded, :archived, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)
