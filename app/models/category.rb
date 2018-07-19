class Category < ApplicationRecord
  has_and_belongs_to_many :articles, join_table: :articles_categories
end
