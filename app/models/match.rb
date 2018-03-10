class Match < ApplicationRecord
  belongs_to :event
  has_many :match_players
end
