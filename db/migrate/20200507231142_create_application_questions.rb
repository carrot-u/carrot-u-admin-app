class CreateApplicationQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :application_questions do |t|
      t.text :text
      t.string :role
      t.boolean :current

      t.timestamps
    end
  end
end
