class College < ActiveRecord::Base
  validates :college_name, presence: true
  enum type: %i("私立" "国公立" "短大")
end
