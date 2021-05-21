class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :availability, default: true
      t.text :description

      t.timestamps
    end
  end
end
