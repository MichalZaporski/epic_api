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
        courses = scope_name(courses) if params[:name]
        courses = scope_min_price(courses) if params[:price_min]
        courses = scope_max_price(courses) if params[:price_max]
        courses = scope_category_by_id(courses) if params[:category_id]
        courses = scope_category_by_name(courses) if params[:category]

        render json: CoursesRepresenter.new(courses).as_json
      end

      def show
        render json: @restaurant.courses.find(params[:course_id])
      end

      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

      def scope_name(course)
        course.name_like(params[:name])
      end

      def scope_min_price(course)
        course.min_price(params[:price_min])
      end

      def scope_max_price(course)
        course.max_price(params[:price_max])
      end

      def scope_category_by_id(course)
        course.category_filter_id(params[:category_id])
      end

      def scope_category_by_name(course)
        course.category_filter_name(params[:category])
      end

      def restaurant_not_found(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
