class CreateWaitingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :waiting_lists do |t|
      t.references :user, null: false, foreign_key: true
      # the course session will be null initially, set the id when the student is invited to apply
      t.references :course_session, null: true, foreign_key: true

      t.timestamps
    end

    # ensure a user only adds themselves to the list once
    add_index(:waiting_lists, [:user_id, :course_session_id])
  end
end
