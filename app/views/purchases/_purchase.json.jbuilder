json.extract! purchase, :id, :first_name, :last_name, :shipping_1, :shipping_2, :shipping_city, :shipping_state, :shipping_zip, :shipping_country, :phone, :total, :basket_id, :user_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
