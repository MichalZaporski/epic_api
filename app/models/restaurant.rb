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

  def self.count_opinions(restaurants)
    opinions = {}
    opinions_number = {}

    restaurants.each do |restaurant|
      orders = []
      sum = 0
      count = 0
      restaurant.courses.each do |course|
        course.line_items.each do |item|
          next if orders.include? item.order

          orders.append item.order
          next unless item.order.opinion

          sum += item.order.opinion
          count += 1
        end
      end
      if count.zero?
        opinions[restaurant.id] = 0
      else
        opinions[restaurant.id] = sum / count.to_f
      end
      opinions_number[restaurant.id] = count
    end

    [opinions, opinions_number]
  end
end
