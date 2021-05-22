class CoursesController < ApplicationController
  before_action :set_restaurant

  def index
    render json: @restaurant.courses
  end

  def search
    scope = @restaurant.courses
    filters = params.permit(:category).to_h.compact
    scope = scope.where(filters) if filters.any?
    scope = scope.min_price_scope(params[:price_min]) if params[:price_min]
    scope = scope.max_price_scope(params[:price_max]) if params[:price_max]
    render json: scope
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
