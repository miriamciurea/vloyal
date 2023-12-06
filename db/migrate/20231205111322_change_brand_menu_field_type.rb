class ChangeBrandMenuFieldType < ActiveRecord::Migration[7.1]
  def change
    remove_column :brands, :menu
    # add_column :brands, :menu, :json, array: true, default: []
    add_column :brands, :menu, :json
  end
end
