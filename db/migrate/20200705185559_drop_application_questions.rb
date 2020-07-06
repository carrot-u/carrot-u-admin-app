class DropApplicationQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :application_answers, :application_questions
    rename_column :application_answers, :application_question_id, :question_key
    drop_table :application_questions, cascade: true
  end
end
