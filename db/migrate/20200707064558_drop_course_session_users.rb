class DropCourseSessionUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :course_session_users
  end
end
