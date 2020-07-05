class AddTopicToLectures < ActiveRecord::Migration[6.0]
  def change
    add_column :lectures, :topic, :integer 
  end
end
