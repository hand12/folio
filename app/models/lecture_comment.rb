class LectureComment < ActiveRecord::Base
  belongs_to :lecture
  validates :difficulty, presence: true
end
