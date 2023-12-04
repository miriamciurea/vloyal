class AddFileNameToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :file_name, :string, null: false, default: 'bean.svg'
  end
end
