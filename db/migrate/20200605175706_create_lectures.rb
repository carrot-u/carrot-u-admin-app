class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :lecture_name
      t.string :lecture_content
      t.string :video_link
      t.references :homework
      t.references :teacher

      t.timestamps
    end
  end
end
