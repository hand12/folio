class Lecture < ActiveRecord::Base
  has_many :products
  belongs_to :college
  validates :lecture_title, presence: true
end
