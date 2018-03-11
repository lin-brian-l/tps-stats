class Tournament < ApplicationRecord
  has_many :tournament_attendees
  has_many :attendees, class_name: "Player", through: :tournament_attendees, source: :player 
  
  has_many :events
  has_many :phases, through: :events
  has_many :groups, through: :phases
  has_many :matches, through: :groups
end
