class CreateCourseSessionUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :course_session_users do |t|
      t.references :user
      t.references :course_session
      t.string :role
      t.boolean :notification_sent
      t.timestamp :manager_approved_at
      t.timestamp :accepted_at

      t.timestamps
    end
  end
end
