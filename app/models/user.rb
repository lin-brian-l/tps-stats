class User < ApplicationRecord
  has_many :entries

  validates :username, presence: true, uniqueness: { message: "must be unique"}
  validates :email, presence: true, uniqueness: true
  validate :empty_password
  validates :encrypted_password, presence: true

  def empty_password
    if @temp_password.empty?
      errors.add(:encrypted_password, "must not be blank")
    end
  end

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    @temp_password = new_password
    self.encrypted_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    end
  end

end
