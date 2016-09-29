class AddProductImageIdToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :college, index: true
    add_reference :products, :lecture, index: true
  end
end
