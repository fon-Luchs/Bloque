class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true, length: { maximum: 65 }
end
