class CreateProductComments < ActiveRecord::Migration
  def change
    create_table :product_comments do |t|
      t.text :content
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
