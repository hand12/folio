class Product < ActiveRecord::Base
  belongs_to :college
  belongs_to :lecture
  belongs_to :user
  has_many :product_images, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :product_images, reject_if: :reject_images
  attr_accessor :college_name
  attr_accessor :lecture_title
  validates :title, :concept, presence: true

  def reject_images(attributed)
    attributed['image'].blank?
  end

  def main_image
    self.product_images.main.first.image if self.product_images.main.first.image
  end

  def sub_image(num)
    self.product_images.sub[num].image
  end

  def image_boies
    self.product_images.sub
  end

  def col_name
    self.college.college_name if self.college.college_name?
  end

  def lec_title
    self.lecture.lecture_title if self.lecture.lecture_title?
  end

  def college_lecture_name
    college = self.col_name
    lecture = self.lec_title
    return college + "/" + lecture
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
