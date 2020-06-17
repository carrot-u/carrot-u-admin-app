class CreateHomeworkSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_submissions do |t|
      t.references :course_session_user, null: false, foreign_key: true
      t.references :homework, null: false, foreign_key: true
      t.string :pull_request
      t.boolean :is_public

      t.timestamps
    end
  end
end
