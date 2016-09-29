class ChangeTypeToCollege < ActiveRecord::Migration
  def change
    rename_column :colleges, :type, :kind
  end
end
