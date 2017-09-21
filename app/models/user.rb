class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.oassword == password
      @user
    end
  end

end
