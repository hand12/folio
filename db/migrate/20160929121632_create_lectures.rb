class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :lecture_title
      t.string :teacher
      t.text :content
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
