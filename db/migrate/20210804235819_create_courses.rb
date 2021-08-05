class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :seats
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :time

      t.timestamps
    end
  end
end
