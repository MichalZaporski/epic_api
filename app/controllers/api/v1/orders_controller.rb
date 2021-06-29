module Api
  module V1
    class OrdersController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :set_user, only: [:index]
      before_action :authenticate_user, only: [:index]

      rescue_from ActiveRecord::RecordInvalid, with: :incorrect_order
      rescue_from ActionController::ParameterMissing, with: :incorrect_order
      rescue_from ActiveRecord::RecordNotFound, with: :incorrect_order

      def index
        orders = @user.orders

        render json: orders
      end

      def create
        new_order = Order.new(order_params)
        new_order.status = 0
        new_order.save!

        if new_order.add_items(order_items[:items])
          render json: new_order, status: :created
        else
          new_order.delete
          head :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def order_params
        params.require(:order).permit(:user_id, :city, :street, :street_number, :phone_number, :note, :personal_pickup)
      end

      def order_items
        params.require(:order).permit(items: {})
      end

      def incorrect_order(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end

      def authenticate_user
        # Authorization: Bearer token_here
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        head :unauthorized
      end
    end
  end
end
