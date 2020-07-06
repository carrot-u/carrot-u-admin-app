class DropApplicationQuestions < ActiveRecord::Migration[6.0]
  def change
    drop_table :application_questions
  end
end
