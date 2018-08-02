class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :body, presence: true

  after_save :get_user_name
  after_save :get_user_id

  private

  def get_user_id
    self.user_id = user.id
  end

  def get_user_name
    self.commenter = user.user_name
  end
end
