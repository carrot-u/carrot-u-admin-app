class ChangeManagerToReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :users_managers, :manager_email
    add_reference :users_managers, :manager, foreign_key: { to_table: :users }
  end
end
