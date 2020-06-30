class ChangeScheduleDateToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :lectures, :schedule_date, :datetime
  end
end
