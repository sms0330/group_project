class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :is_teacher
      t.string :first_name
      t.string :last_name
      t.string :email, index: {unique: true} 
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
