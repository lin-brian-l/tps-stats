class Player < ApplicationRecord
  has_many :attended_tournaments, class_name: "TournamentAttendee", foreign_key: :player_id
  has_many :played_matches_1, class_name: "Match", foreign_key: :player1_id
  has_many :played_matches_2, class_name: "Match", foreign_key: :player2_id
  has_many :won_matches, class_name: "Match", foreign_key: :winner_id
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id
  has_many :entered_events, class_name: "EventEntrant", foreign_key: :player_id
  
end
