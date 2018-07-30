class Category < ApplicationRecord
  has_many :filters
  has_many :articles, through: :filters

  after_save :get_user_id
  after_save :get_user_name

  private

  def get_user_id
    self.user_id = user.id
  end

  def get_user_name
    self.commenter = user.user_name
  end
end
