class User < ApplicationRecord
  has_many :entries, foreign_key: :author_id
  validates :username, :email, :encrypted_password, { presence: true }
  validates :username, uniqueness: true
  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
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
