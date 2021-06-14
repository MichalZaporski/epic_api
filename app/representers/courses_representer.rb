class CoursesRepresenter
  include ActionView::Helpers::NumberHelper

  def initialize(courses)
    @courses = courses
  end

  def as_json
    @courses.map do |course|
      next unless course.availability

      {
        id: course.id,
        name: course.name,
        description: course.description,
        price: number_to_currency(course.price),
        category: course.category.category_name,
        restaurant_id: course.restaurant.id
      }
    end
  end
end
