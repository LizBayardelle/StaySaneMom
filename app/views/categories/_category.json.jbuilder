json.extract! category, :id, :name, :active, :description, :intro, :bad_adjective, :good_adjective, :main_photo_url, :photo_2_url, :photo_3_url, :created_at, :updated_at
json.url category_url(category, format: :json)
