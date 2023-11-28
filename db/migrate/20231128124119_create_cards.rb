class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.integer :stamps
      t.references :brand, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
