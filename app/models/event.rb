class Event < ApplicationRecord
  belongs_to :tournament

  has_many :event_entrants
  has_many :entrants, class_name: "Player", through: :event_entrants, source: :player 

  has_many :phases
  has_many :groups, through: :phases
  has_many :matches, through: :groups
end