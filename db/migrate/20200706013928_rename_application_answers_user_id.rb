class RenameApplicationAnswersUserId < ActiveRecord::Migration[6.0]
  def change
    remove_column :application_answers, :user_id
    add_reference :application_answers, :course_session_participant, foreign_key: true
    change_column :application_answers, :question_key, :string
  end
end
