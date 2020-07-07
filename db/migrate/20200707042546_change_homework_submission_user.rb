class ChangeHomeworkSubmissionUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :homework_submissions, :course_session_user_id if column_exists? :homework_submissions, :course_session_user_id
    add_column :homework_submissions, :course_session_participant_id, :bigint
  end
end
