class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :street
      t.string :street_number
      t.int :stars
      t.string :phone_number

      t.timestamps
    end
  end
end
