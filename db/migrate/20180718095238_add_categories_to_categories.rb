class AddCategoriesToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :categories, :string
    add_index :categories, :categories, unique: true
  end
end
