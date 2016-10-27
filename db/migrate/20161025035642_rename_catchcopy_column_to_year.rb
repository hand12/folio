class RenameCatchcopyColumnToYear < ActiveRecord::Migration
  def change
    rename_column :products, :catchcopy, :year
  end
end
