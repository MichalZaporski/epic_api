class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.integer :opinion
      t.integer :status

      t.timestamps
    end
  end
end
