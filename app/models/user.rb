class User < ApplicationRecord
  include BCrypt

  has_many :entries
  validates :username, presence: { message: "Please enter a username"}
  validates :email, presence: { message: "Please enter a email"}

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(plain_password)
    @raw_password = plain_password
    @password = Password.create(plain_password)
    self.encrypted_password = @password
  end

  def authenticate(plain_password)
    self.password == plain_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "Password is required")
    elsif
      errors.add(:password, "Password must be 6 characters or more")
    end
  end

end
