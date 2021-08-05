class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :seats
      t.date :start_date
      t.date :end_date
      t.time :time

      t.timestamps
    end
  end
end
