class User < ApplicationRecord
  class AuthenticationError < StandardError; end
  has_many :orders

  validates_length_of :email, in: 3..35
  validates :email, :name, :surname, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
