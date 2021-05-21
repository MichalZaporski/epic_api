class ChangeAvailabilityInCources < ActiveRecord::Migration[6.1]
  def change
    change_table :courses do |t|
      t.change :availability, :boolean, {default: true}
    end

    add_column :courses, :price, :int
  end
end
