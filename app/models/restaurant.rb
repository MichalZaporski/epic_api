class Restaurant < ApplicationRecord
  validates :name, :description, :city, :street, :street_number, :phone_number, presence: true

  has_many :courses, dependent: :destroy
  has_one_attached :photo

  scope :city_like, ->(city) { where("city like ?", "%#{city}%") }
  scope :name_like, ->(name) { where("restaurants.name like ?", "%#{name}%") }
  scope :category_filter, ->(category) { joins(courses: :category).where("categories.id = ?", category).distinct }

  def self.restaurants_categories(restaurants)
    categories = {}

    restaurants.each do |restaurant|
      categories[restaurant.id] = []

      restaurant.courses.each do |course|
        category = course.category.category_name
        categories[restaurant.id].append category unless categories[restaurant.id].include? category
      end
    end

    categories
  end
end
