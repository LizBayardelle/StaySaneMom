json.extract! meal, :id, :title, :ready_in_minutes, :image, :gluten_free, :dairy_free, :vegetarian, :vegan, :ingredients, :instructions, :downloaded, :favorite, :user_id_id, :notes, :created_at, :updated_at
json.url meal_url(meal, format: :json)
