class ChangeCategoryState < ActiveRecord::Migration[5.2]
  def change
    remove_index :categories, :category
    add_index    :categories, :category
  end
end
