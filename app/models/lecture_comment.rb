class LectureComment < ActiveRecord::Base
  belongs_to :lecture 
  belongs_to :user
  validates :difficulty, presence: true
end
