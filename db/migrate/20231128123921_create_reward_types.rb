class CreateRewardTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :reward_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
