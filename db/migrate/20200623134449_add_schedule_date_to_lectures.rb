class AddScheduleDateToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :schedule_date, :date
  end
end
