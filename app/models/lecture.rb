class Lecture < ActiveRecord::Base
  has_many :products
  has_many :lecture_comments
  belongs_to :college
  validates :lecture_title, presence: true
end
