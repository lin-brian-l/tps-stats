require 'bcrypt'

class User < ApplicationRecord

  has_many :entries, foreign_key: "author_id"

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username,string_password)
    user = self.where('user_name = ?', username)
    user.first.password == string_password
  end

  def self.i_am(username, string_password)
    if self.authenticate(username,string_password)
      self.where('user_name = ?', username).first[:id]
    else
      nil
    end
  end

end
