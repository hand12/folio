class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :concept
      t.string :catchcopy

      t.timestamps
    end
  end
end
