class CreateLectureComments < ActiveRecord::Migration
  def change
    create_table :lecture_comments do |t|
      t.integer :difficulty
      t.text :comment
      t.references :lecture, foreign_key: true
      t.timestamps
    end
  end
end
