class Event < ApplicationRecord
  belongs_to :tournament
  has_many :event_entrants
  has_many :matches
end