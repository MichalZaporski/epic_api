class User < ApplicationRecord
  class AuthenticationError < StandardError; end
  has_many :orders

  validates :email, :name, :surname, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
