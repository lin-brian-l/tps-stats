class User < ApplicationRecord
  has_many :entries
  validates :username, :email, uniqueness: true
  validates :email, :username, presence: true
  validates :encrypted_password, presence: true, length: {minimum: 6}




  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
