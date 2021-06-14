module Api
  module V1
    class CoursesController < ApplicationController
      before_action :set_restaurant
      rescue_from ActiveRecord::RecordNotFound, with: :restaurant_not_found

      def index
        render json: @restaurant.courses
      end

      def search
        courses = @restaurant.courses
        # filters = params.permit(:category).to_h.compact
        # scope = scope.where(filters) if filters.any?
        courses = scope_min_price(courses) if params[:price_min]
        courses = scope_max_price(courses) if params[:price_max]
        courses = courses.find_by(category_id: params[:category_id]) if params[:category_id] # can return nil if no rsults

        render json: CoursesRepresenter.new(courses).as_json
      end

      def show
        render json: @restaurant.courses.find(params[:course_id])
      end

      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

      def scope_min_price(course)
        course.min_price(params[:price_min])
      end

      def scope_max_price(course)
        course.max_price(params[:price_max])
      end

      def restaurant_not_found(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
