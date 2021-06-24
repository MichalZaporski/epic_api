module Api
  module V1
    class RestaurantsController < ApplicationController
      def index
        render json: Restaurant.all
      end

      def search
        restaurants = Restaurant.all
        restaurants = city_filter(restaurants) if params[:city]
        restaurants = name_filter(restaurants) if params[:name]
        restaurants = category_filter(restaurants) if params[:category_id]

        categories = Restaurant.restaurants_categories(restaurants)

        render json: RestaurantsRepresenter.new(restaurants, categories).add_categories
      end

      # get restaurants/:restaurant_id/photo
      def photo
        restaurant = Restaurant.find(params[:restaurant_id])

        redirect_to rails_blob_url(restaurant.photo) if restaurant&.photo&.attached?
      end

      private

      def city_filter(restaurants)
        restaurants.city_like(params[:city])
      end

      def name_filter(restaurants)
        restaurants.name_like(params[:name])
      end

      def category_filter(restaurants)
        restaurants.category_filter(params[:category_id])
      end
    end
  end
end
