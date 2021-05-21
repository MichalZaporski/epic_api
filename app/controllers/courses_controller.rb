class CoursesController < ApplicationController
  def index
    render json: Course.all # dodac wyszukiwanie tylko po id restauracji
  end

  def search
    scope = Course.all
    filters = params.permit(:category).to_h.compact # dodac id kategorii i id restauracji
    scope = scope.where(filters) if filters.any?
    scope = scope.min_price_scope(params[:price_min]) if params[:price_min]
    scope = scope.max_price_scope(params[:price_max]) if params[:price_max]
    render json: scope
  end
end
