class OrdersRepresenter
  def initialize(orders)
    @orders = orders
  end

  def as_json_extended
    @orders.map do |order|
      restaurant_name = order.line_items.first.course.restaurant.name
      courses = []
      order.line_items.each do |item|
        courses.append item.course.name
      end

      {
        id: order.id,
        opinion: order.opinion,
        status: order.status,
        created_at: order.created_at.strftime("%F %T"),
        updated_at: order.updated_at.strftime("%F %T"),
        city: order.city,
        street: order.street,
        street_number: order.street_number,
        phone_number: order.phone_number,
        note: order.note,
        personal_pickup: order.personal_pickup,
        courses: courses,
        restaurant: restaurant_name
      }
    end
  end
end
