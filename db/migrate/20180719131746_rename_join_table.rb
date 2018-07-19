class RenameJoinTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :tests, :articles_categories
  end
end
