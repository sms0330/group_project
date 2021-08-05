class AddDescriptionToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :description, :string
  end
end
