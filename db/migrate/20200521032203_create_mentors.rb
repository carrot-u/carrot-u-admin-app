class CreateMentors < ActiveRecord::Migration[6.0]
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :manager_name
      t.string :manager_email
      t.boolean :is_active
      t.boolean :is_approved
      t.text :skills

      t.timestamps
    end
  end
end
