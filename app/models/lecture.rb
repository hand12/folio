class Lecture < ActiveRecord::Base
  has_many :products
  has_many :lecture_comments
  belongs_to :college
  belongs_to :user
  validates :lecture_title, presence: true
end
