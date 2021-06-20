class Course < ApplicationRecord
  validates :name, :availability, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  belongs_to :restaurant
  belongs_to :category, optional: true

  has_many :line_items

  scope :name_like, ->(name) { where("name like ?", "%#{name}%") }
  scope :min_price, ->(min) { where("price >= ?", min) }
  scope :max_price, ->(max) { where("price <= ?", max) }
  scope :category_filter_id, ->(category_id) { where("category_id = ?", category_id) }
  scope :category_filter_name, ->(category) { joins(:category).where("categories.category_name = ?", category) }
end
