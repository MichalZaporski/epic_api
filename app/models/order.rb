class Order < ApplicationRecord
  validates_length_of :city, maximum: 35
  validates_length_of :street, maximum: 35
  validates_length_of :street_number, maximum: 8
  validates_length_of :phone_number, maximum: 11
  validates_length_of :note, maximum: 50
  validates :opinion, allow_nil: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy

  enum status: { 'placed' => 0, 'shipped' => 1, 'delivered' => 2 }

  def add_items(items)
    return false unless items

    items.each do |item|
      line_item = line_items.build(course_id: item[0], quantity: item[1])
      return false unless line_item.save
    end

    true
  end
end
