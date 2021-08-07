class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :seats
      t.date :start_date
      t.date :end_date
      t.time :time_start
      t.time :time_end

      t.timestamps
    end
  end
end
