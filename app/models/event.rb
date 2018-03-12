class Event < ApplicationRecord
  belongs_to :tournament

  has_many :results, class_name: "EventEntrant"
  has_many :entrants, class_name: "Player", through: :event_entrants, source: :player 

  has_many :phases
  has_many :groups, through: :phases
  has_many :matches, through: :groups

  def list_results
    standings = self.results
    ordered_standings = standings.sort_by { |standing| standing.placing }
    ordered_standings.map do |standing| 
      "#{standing.placing}#{get_suffix(standing.placing)}: #{standing.player.full_tag}"
    end
  end
end

def get_suffix(placing)
  return "th" if (placing.between?(4,20))
  case placing.digits.first
    when 1
      "st"
    when 2
      "nd"
    when 3
      "rd"
    else
      "th"
  end
end