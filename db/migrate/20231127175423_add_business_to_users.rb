class AddBusinessToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :business, :boolean, default: false
  end
end
