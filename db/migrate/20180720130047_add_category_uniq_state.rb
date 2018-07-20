class AddCategoryUniqState < ActiveRecord::Migration[5.2]
  def change
    remove_index :categories, :category
    add_index :categories, :category, unique: true
  end
end
