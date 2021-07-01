module Api
  module V1
    class UsersController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        user = User.new(user_params)
        if user.save
          head :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :surname, :password, :password_confirmation)
      end

      def parameter_missing
        head :unprocessable_entity
      end
    end
  end
end
