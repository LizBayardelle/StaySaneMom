json.extract! capsule, :id, :user_id, :name, :date, :active, :reminder_email, :comments, :created_at, :updated_at
json.url capsule_url(capsule, format: :json)
