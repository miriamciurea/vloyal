class AddDefaultValueToStampsCards < ActiveRecord::Migration[7.1]
  def change
    change_column :cards, :stamps, :integer, default: 0, null: false
  end
end
