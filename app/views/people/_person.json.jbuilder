json.extract! person, :id, :relationship, :first_name, :middle_name, :last_name, :birthday, :anniversary, :other, :other_date_name, :notes, :user_id, :created_at, :updated_at
json.url person_url(person, format: :json)
