class User < ApplicationRecord
  has_many :entries

  validates :username, :email, { presence: true }
end
