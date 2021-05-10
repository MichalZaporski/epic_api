class ApplicationController < ActionController::Base
  # because of making an API
  skip_before_action :verify_authenticity_token
end
