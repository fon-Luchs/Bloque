class DropTableArticlesCategories < ActiveRecord::Migration[5.2]
  def up
    drop_table :articles_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
