class AddDefaultValueToClaimedRewards < ActiveRecord::Migration[7.1]
  def change
    change_column :rewards, :claimed, :boolean, default: false
  end
end
