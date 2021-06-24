class AddNoteToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :note, :string
    add_column :orders, :personal_pickup, :boolean
    change_column_null :orders, :user_id, true
  end
end
