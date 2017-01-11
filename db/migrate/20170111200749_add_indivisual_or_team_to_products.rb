class AddIndivisualOrTeamToProducts < ActiveRecord::Migration
  def change
    add_column :products, :indivisualOrTeam, :integer, default: 0
  end
end
