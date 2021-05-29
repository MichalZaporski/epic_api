module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from User::AuthenticationError, with: :unauthenticated

      def create
        user = User.find_by(email: params.require(:email))
        raise User::AuthenticationError unless user.authenticate(params.require(:password))

        jwt = AuthenticationTokenService.call(user.id)

        render json: { token: jwt }, status: :created
      end

      private

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end

      def unauthenticated
        head :unauthorized
      end
    end
  end
end
