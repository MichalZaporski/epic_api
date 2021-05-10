class StaticController < ApplicationController
  def home
    render json: { status: "dziala" }
  end
end
