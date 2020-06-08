class AddRepositoryLinkToCourseSessions < ActiveRecord::Migration[6.0]
  def change
    change_table :course_sessions do |t|
      t.string  :repository_link
    end
  end
end
