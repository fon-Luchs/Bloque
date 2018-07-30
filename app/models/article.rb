class Article < ApplicationRecord
  attr_accessor :article_categories_arr
  has_many :comments, dependent: :destroy, inverse_of: :article
  belongs_to :user
  has_many :filters
  has_many :categories, through: :filters

  validates_associated :comments
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true

  after_save :get_username

  def all_categories
    self.categories.map(&:categories).join(', ')
  end

  def all_categories=(categories)
    self.categories = categories.split(',').map do |category|
      Category.where(category: category.strip).first_or_create
    end
  end

  private

  def get_username
    self.user_name = user.user_name
  end
end
