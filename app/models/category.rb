class Category < ApplicationRecord
  has_many :filters
  has_many :articles, through: :filters
end
