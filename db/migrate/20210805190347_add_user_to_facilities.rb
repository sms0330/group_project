class AddUserToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_reference :facilities, :user, null: true, foreign_key: true
  end
end
