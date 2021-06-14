class RestaurantsRepresenter
  include Rails.application.routes.url_helpers

  def initialize(restaurants, categories)
    @restaurants = restaurants
    @categories_hash = categories
  end

  def add_categories
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
        # stars: ? dodac gwaizdki
        phone_number: restaurant.phone_number,
        categories: @categories_hash[restaurant.id],
        image: photo
      }
    end
  end
end
