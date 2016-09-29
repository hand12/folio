class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :college_name
      t.integer :type, default: 0
      t.string :locate

      t.timestamps
    end
  end
end
