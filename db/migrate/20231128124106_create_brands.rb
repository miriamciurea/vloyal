class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.references :reward_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :card_style, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :menu
      t.string :website
      t.float :rating

      t.timestamps
    end
  end
end
