class College < ActiveRecord::Base
  has_many :lectures, dependent: :destroy
  has_many :products
  validates :college_name, presence: true
  enum kind: %i("私立" "国公立" "短大")
end
