class Match < ApplicationRecord
  
  belongs_to :group
  has_one :phase, through: :group
  has_one :event, through: :phase
  has_one :tournament, through: :event

  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"
  belongs_to :player1, class_name: "Player", foreign_key: :player1_id
  belongs_to :player2, class_name: "Player", foreign_key: :player2_id

  def self.query_event(event_id)  
    select { |match| match.event.id == event_id }
  end

  def self.query_event_losers(event_id)
    select { |match| match.event.id == event_id && match.loser_placing }
  end

  def self.list_results(event_id)
    matches = self.query_event_losers(event_id)
    matches.sort_by! { |match| match.loser_placing }
    matches.flat_map do |match| 
      loser_info = "#{match.loser_placing}#{get_suffix(match.loser_placing)}: #{match.loser.full_tag}"
      if match.winner_placing == 1
        winner_info = "#{match.winner_placing}#{get_suffix(match.winner_placing)}: #{match.winner.full_tag}"
        [winner_info, loser_info]
      else
        [loser_info]
      end
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