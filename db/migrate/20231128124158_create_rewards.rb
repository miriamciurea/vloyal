class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.boolean :claimed
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
