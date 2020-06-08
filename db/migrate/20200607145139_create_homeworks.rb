class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.text :content
      t.references :lecture
      t.text :status
      t.date :due_date

      t.timestamps
    end
  end
end
