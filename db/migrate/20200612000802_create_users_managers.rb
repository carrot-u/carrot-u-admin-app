class CreateUsersManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_managers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :manager, null: false, foreign_key: true
      t.boolean :current

      t.timestamps
    end
  end
end
