class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.text :image
      t.references :product, foreign_key: true, index: true
      t.integer :status

      t.timestamps
    end
  end
end
