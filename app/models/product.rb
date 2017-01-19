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

  acts_as_taggable_on :labels
  acts_as_taggable

  enum indivisualOrTeam: %i(個人 チーム開発)

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
    self.college ? self.college.college_name : "大学名なし"
  end

  def lec_title
    self.lecture ? self.lecture.lecture_title : "授業なし"
  end

  def college_lecture_name
    college = self.try(:col_name)
    lecture = self.try(:lec_title)
    return college + "/" + lecture
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
