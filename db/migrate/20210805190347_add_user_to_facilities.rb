class AddUserToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_reference :facilities, :user, foreign_key: true
  end
end
