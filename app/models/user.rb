require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :entries

  validates :username, :email, { presence: true }

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def self.authenticate(username, password)
    User.all.each do |user|
      if user.username == username && user.password == password
        return user
      end
    end
    nil
  end
end
