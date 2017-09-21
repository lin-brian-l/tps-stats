class User < ApplicationRecord
  has_many :entries

  validates_presence_of :email, :username
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(input_password)
    @password = BCrypt::Password.create(input_password)
    self.hashed_password = @password
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