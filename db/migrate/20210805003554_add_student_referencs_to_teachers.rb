class AddStudentReferencsToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_reference :teachers, :student, null: false, foreign_key: true
  end
end
