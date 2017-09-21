class User < ApplicationRecord
  validates :email, :username, :encrypted_password, { presence: false }
  validates :username, :email, { uniqueness: true }

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(username, password)
    self.password == password && self.username == username
  end
end
