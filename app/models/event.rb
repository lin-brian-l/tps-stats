class Event < ApplicationRecord
  belongs_to :tournament

  has_many :results, class_name: "EventEntrant"
  has_many :entrants, class_name: "Player", through: :event_entrants, source: :player 

  has_many :phases
  has_many :groups, through: :phases
  has_many :matches, through: :groups

  def list_results
    self.output_results(self.sort_results)
  end

  def list_top_8
    top_8_results = self.sort_results.select { |result| result.placing <= 7 }
    self.output_results(top_8_results)
  end

  def sort_results
    standings = self.results
    standings.sort_by { |standing| standing.placing }
  end

  def output_results(standing_array)
    standing_array.map do |standing| 
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