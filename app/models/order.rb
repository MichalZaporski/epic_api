class Order < ApplicationRecord
  validates_length_of :city, maximum: 35
  validates_length_of :street, maximum: 35
  validates_length_of :street_number, maximum: 8
  validates_length_of :phone_number, maximum: 11
  validates_length_of :note, maximum: 50

  belongs_to :user, optional: true

  has_many :line_items, dependent: :destroy

  enum status: { 'placed' => 0, 'shipped' => 1, 'delivered' => 2 }

  def add_items(items)
    return false unless items
    p items
    items.each do |item|
      p 'SIEMAAAAAAAAA'
      p item[0]
      p item[1]
      p 'SIEMAAAAAAAAA'
      line_item = line_items.build(course_id: item[0], quantity: item[1])
      return false unless line_item.save
    end

    true
  end
end
