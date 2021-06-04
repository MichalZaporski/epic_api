FactoryBot.define do
  factory :line_item do
    order_id { nil }
    course_id { nil }
    quantity { 1 }
  end
end
