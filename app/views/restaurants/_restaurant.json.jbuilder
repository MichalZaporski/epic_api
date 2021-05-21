json.extract! restaurant, :id, :name, :description, :city, :street, :street_number, :stars, :phone_number, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
