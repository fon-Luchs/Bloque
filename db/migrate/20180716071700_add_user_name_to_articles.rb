class AddUserNameToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_name, :string
  end
end
