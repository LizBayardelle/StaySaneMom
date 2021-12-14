json.extract! message, :id, :message_type, :from_name, :from_email, :subject, :body, :answered, :created_at, :updated_at
json.url message_url(message, format: :json)
