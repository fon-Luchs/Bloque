class Article < ApplicationRecord
  has_many :comments, dependent: :destroy, inverse_of: :article
  belongs_to :user
  validates_associated :comments
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
end
