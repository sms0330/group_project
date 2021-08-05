class AddTeacherReferencsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_reference :students, :teacher, null: false, foreign_key: true
    add_reference :students, :course, null: false, foreign_key: true
  end
end
