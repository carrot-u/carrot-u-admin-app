class DropStudents < ActiveRecord::Migration[6.0]
  def change
    drop_table :students
  end
end
