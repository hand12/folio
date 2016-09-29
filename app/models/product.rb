class Product < ActiveRecord::Base
  validates :title, :catchcopy, :concept, presence: true

  def reject_images(attributed)
    attributed['image'].blank?
  end
end
