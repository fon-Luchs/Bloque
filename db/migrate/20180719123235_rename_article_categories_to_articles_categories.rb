class RenameArticleCategoriesToArticlesCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :article_categories, :articles_categories
  end
end
