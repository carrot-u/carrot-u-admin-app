class AddLectureToCourseSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :course_sessions, :lectures, foreign_key: true
  end
end
