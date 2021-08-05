class AddTeacherReferencsToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :teacher, null: false, foreign_key: true
    add_reference :courses, :student, null: false, foreign_key: true
  end
end
