class Course < ApplicationRecord
  validates :name, :availability, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :restaurant
  belongs_to :category, optional: true

  scope :min_price_scope, ->(min) { where("price >= ?", min) }
  scope :max_price_scope, ->(max) { where("price <= ?", max) }
end
