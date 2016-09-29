class ProductImage < ActiveRecord::Base
  enum status: %i(main sub)
  validates :status, presence: true
end
