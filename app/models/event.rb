class Event < ApplicationRecord
  belongs_to :tournament
  has_many :players
  has_many :matches
end