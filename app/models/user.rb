require 'bcrypt'

class User < ApplicationRecord
  validates :username, { presence: true }
  validates :email, { uniqueness: true }

  def password
    @user_password ||= BCrypt::Password.new(password)
  end

  def password=(new_password)
    @user_password = BCrypt::Password.create(new_password)
    self.password = @user_password
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
