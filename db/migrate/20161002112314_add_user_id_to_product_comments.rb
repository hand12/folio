class AddUserIdToProductComments < ActiveRecord::Migration
  def change
    add_reference :product_comments, :user, index: true
  end
end
