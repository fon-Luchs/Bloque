class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :body, presence: true

  before_create :set_commenter_name

  def set_commenter_id(user)
    self.user_id = user.id
  end

  private

  def set_commenter_name
    self.commenter = "#{user.user_name}"
  end
end
