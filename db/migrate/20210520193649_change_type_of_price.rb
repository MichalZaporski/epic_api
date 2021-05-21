class ChangeTypeOfPrice < ActiveRecord::Migration[6.1]
  def change
    change_table :courses do |t|
      t.change :price, :decimal
    end
  end
end
