class ChangeCourse < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :category, null: true, foreign_key: true
    add_reference :courses, :restaurant, null: true, foreign_key: true

    change_table :courses do |t|
      t.change :price, :decimal, precision: 8, scale: 2
    end
  end
end
