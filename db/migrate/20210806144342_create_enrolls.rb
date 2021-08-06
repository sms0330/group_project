class CreateEnrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :enrolls do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :course, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
