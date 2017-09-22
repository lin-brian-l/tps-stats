require 'bcrypt'

class User < ApplicationRecord
  has_many :entries
  validates :username, presence: true, uniqueness: true
  validates :password_key, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+.]+@[a-z\d]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 255 }

  before_save { self.email = email.downcase }



  def password
    @password ||= BCrypt::Password.new(password_key)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_key = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user && user.password == password
  end
end
