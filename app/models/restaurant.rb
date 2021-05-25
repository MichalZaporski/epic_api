class Restaurant < ApplicationRecord
  validates :name, :description, :city, :street, :street_number, :phone_number, presence: true

  has_many :courses, dependent: :destroy

  scope :city_like, ->(city) { where("city like ?", "%#{city}%") }
  scope :name_like, ->(name) { where("restaurants.name like ?", "%#{name}%") }
  scope :category_filter, ->(category) { joins(courses: :category).where("categories.id = ?", category) }
end
