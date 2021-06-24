class EditUser < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :city, :string
    add_column :orders, :street, :string
    add_column :orders, :street_number, :string
    add_column :orders, :phone_number, :string
    remove_column :orders, :date
  end
end
