class CreateApplicationAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :application_answers do |t|
      t.references :application_question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
