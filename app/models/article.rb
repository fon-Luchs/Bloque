class Article < ApplicationRecord
  has_many :comments, dependent: :destroy, inverse_of: :article
  has_and_belongs_to_many :categories, join_table: :article_categories
  belongs_to :user
  validates_associated :comments
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
end
