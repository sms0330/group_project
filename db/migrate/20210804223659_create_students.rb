class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name 
      t.string :email, unique:true
      t.string :passphrase

      t.timestamps
    end
  end
end
#