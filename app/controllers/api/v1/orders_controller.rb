module Api
  module V1
    class OrdersController < ApplicationController
      rescue_from ActiveRecord::RecordInvalid, with: :incorrect_order
      rescue_from ActionController::ParameterMissing, with: :incorrect_order

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

      # dodac opinie, wyswietlanie wszystkich zamowien, zmeinianie statusu

      private

      def order_params
        params.require(:order).permit(:user_id, :city, :street, :street_number, :phone_number, :note, :personal_pickup)
      end

      def order_items
        params.require(:order).permit(items: {})
      end

      def incorrect_order(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end

    end
  end
end
