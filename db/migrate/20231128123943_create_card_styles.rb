class CreateCardStyles < ActiveRecord::Migration[7.1]
  def change
    create_table :card_styles do |t|
      t.string :theme
      t.integer :max_stamps

      t.timestamps
    end
  end
end
