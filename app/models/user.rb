class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lectures
  has_many :lecture_comments
  has_many :products
  has_many :product_comments
  enum admin: %i(false true)

  mount_uploader :avatar, AvatarUploader
end
