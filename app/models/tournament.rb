class Tournament < ApplicationRecord
  has_many :tournament_attendees
  has_many :events
end
