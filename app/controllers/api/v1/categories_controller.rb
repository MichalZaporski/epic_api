module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all

        render json: CategoriesRepresenter.new(categories).remove_unnecessary_data
      end
    end
  end
end
