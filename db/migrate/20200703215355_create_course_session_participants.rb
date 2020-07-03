class CreateCourseSessionParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :course_session_participants do |t|
      t.references :course_session, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamp :manager_approved_at, null: true
      t.timestamp :accepted_at, null: true
      t.string :role, null: false

      t.timestamps
    end
  end
end
