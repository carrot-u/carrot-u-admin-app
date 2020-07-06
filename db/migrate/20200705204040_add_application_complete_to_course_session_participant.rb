class AddApplicationCompleteToCourseSessionParticipant < ActiveRecord::Migration[6.0]
  def change
    add_column :course_session_participant, :application_complete, :boolean
  end
end
