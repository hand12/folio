class Product < ActiveRecord::Base
  belongs_to :college
  belongs_to :lecture
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, reject_if: :reject_images
  attr_accessor :college_name
  attr_accessor :lecture_title
  validates :title, :catchcopy, :concept, presence: true

  def reject_images(attributed)
    attributed['image'].blank?
  end
end
