class AddnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :avatar, :text
    add_column :users, :college_name, :string
  end
end
