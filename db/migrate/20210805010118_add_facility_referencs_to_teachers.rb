class AddFacilityReferencsToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_reference :teachers, :facility, null: false, foreign_key: true
  end
end
