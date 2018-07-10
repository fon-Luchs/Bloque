class User < ApplicationRecord
  attr_accessor :password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name,  presence:         true,
                    length:           { maximum: 40 }

  validates :email, presence:         true,
                    format:           { with: email_regex },
                    uniqueness:       { case_sensitive: false }

  validates :password,  presence:     true,
                        confirmation: true,
                        length:       { within: 6..24 }

  before_save :encrypt_password

  def password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    return user if user.password?(submitted_password)
  end

  private

  def encrypt_password
    self.salt = Digest::SHA1.hexdigest("#{Time.now.utc} -- #{password}") if new_record?

    self.encrypted_password = encrypt(password)
  end

  def encrypt(pass)
    Digest::SHA1.hexdigest("#{salt} -- #{pass}")
  end

end
