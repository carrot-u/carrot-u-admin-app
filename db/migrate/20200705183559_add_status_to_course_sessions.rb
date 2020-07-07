class AddStatusToCourseSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :course_sessions, :status, :integer 
  end
end
