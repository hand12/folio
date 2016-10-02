class AddUserIdToLectureComments < ActiveRecord::Migration
  def change
    add_reference :lecture_comments, :user, index: true
  end
end
