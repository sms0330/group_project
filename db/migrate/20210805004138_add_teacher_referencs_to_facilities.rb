class AddTeacherReferencsToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_reference :facilities, :teacher, null: false, foreign_key: true
  end
end
