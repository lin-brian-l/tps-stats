class User < ApplicationRecord
  has_many :entries
  validates :email, :username, :encrypted_password, { presence: true }
  validates :username, :email, { uniqueness: true }

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(username, password_given)
    self.encrypted_password == password && self.username == username
  end
end
