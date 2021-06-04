class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  enum status: { 'placed' => 0, 'shipped' => 1, 'delivered' => 2 }
end
