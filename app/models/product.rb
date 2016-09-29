class Product < ActiveRecord::Base
  validates :title, :catchcopy, :concept, presence: true
end
