require 'bcrypt'

class User < ApplicationRecord
  has_many :entries
  validates :email, :username, { presence: true, uniqueness: true }
  validates :password, { presence: true }

  def encrypted_password
    @password_encrypt ||= BCrypt::Password.new(password)
  end

  def encrypted_password=(new_password)
    return if new_password.empty?
    @password_encrypt = BCrypt::Password.create(new_password)
    self.password = @password_encrypt
  end

  def self.authenticate(email, password)
    user = User.find_by(:email => email)
    return false if !user
    user.encrypted_password == password
  end

end
