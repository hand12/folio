class Lecture < ActiveRecord::Base
  validates :lecture_title, presence: true
end
