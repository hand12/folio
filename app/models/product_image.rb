class ProductImage < ActiveRecord::Base
  belongs_to :product
  enum status: %i(main sub)
  validates :status, presence: true
  mount_uploader :image, ImageUploader
end
