class AddApplicationCompleteToCourseSessionParticipant < ActiveRecord::Migration[6.0]
  def change
    add_column :course_session_participants, :application_complete, :boolean
  end
end
