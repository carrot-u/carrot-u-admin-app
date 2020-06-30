class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_active
      t.boolean :is_approved
      t.reference :user

      t.timestamps
    end
  end
end
