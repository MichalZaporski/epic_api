class User < ApplicationRecord
  class AuthenticationError < StandardError; end
  validates :email, :name, :surname, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
