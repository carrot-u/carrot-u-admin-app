class CreateCourseSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :course_sessions do |t|
      t.string :name
      t.text :description
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
