class RestaurantsRepresenter
  include Rails.application.routes.url_helpers

  def initialize(restaurants, categories, opinions)
    @restaurants = restaurants
    @categories_hash = categories
    @opinions_hash= opinions[0]
    @opinions_number_hash = opinions[1]
  end

  def as_json_extended
    @restaurants.map do |restaurant|
      photo = if restaurant.photo.attached?
                rails_blob_url restaurant.photo, only_path: true
              else
                nil
              end

      {
        id: restaurant.id,
        name: restaurant.name,
        description: restaurant.description,
        city: restaurant.city,
        street: restaurant.street,
        street_number: restaurant.street_number,
        opinion: @opinions_hash[restaurant.id],
        opinions_number: @opinions_number_hash[restaurant.id],
        phone_number: restaurant.phone_number,
        categories: @categories_hash[restaurant.id],
        image: photo
      }
    end
  end
end
