require 'bcrypt'

class User < ApplicationRecord
  validates :username, { presence: true }
  validates :email, { uniqueness: true }

  def password
    @password ||= BCrypt::Password.new(user_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.user_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
