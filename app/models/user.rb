require 'bcrypt'

class User < ApplicationRecord

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(plain_text_password)
    @password = BCrypt::Password.create(plain_text_password)
    self.encrypted_password = @password
  end



  validates :username, :email, :encrypted_password, { presence: true }
  validates :username, :email, { uniqueness: true }
  validates :username, { length: { in: 3..64,
    too_short: "Usernames must contain at least %{count} characters",
    too_long: "Usernames must be fewer than %{count} characters." } }
  validates :password, { length: { minimum: 8,
    too_short: "Your password must contain at least %{count} characters." } }
end
