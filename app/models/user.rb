class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_writer :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => {email: true, login: false}

  validate :validate_username
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :articles
  def login
    @login || self.user_name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: user_name).exists?
      errors.add(:user_name, :invalid)
    end
  end
end
