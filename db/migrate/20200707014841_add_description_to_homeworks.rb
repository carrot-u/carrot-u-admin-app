class AddDescriptionToHomeworks < ActiveRecord::Migration[6.0]
  def change
    add_column :homeworks, :description, :text
  end
end
