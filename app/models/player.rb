class Player < ApplicationRecord
  belongs_to :user

  has_many :attended_tournaments, class_name: "TournamentAttendee", foreign_key: :player_id
  has_many :tournaments, through: :attended_tournaments, source: :tournament

  has_many :entered_events, class_name: "EventEntrant", foreign_key: :player_id
  has_many :events, through: :entered_events, source: :event

  has_many :entered_phases, class_name: "PhasePlayer", foreign_key: :player_id
  has_many :phases, through: :entered_phases, source: :phase

  has_many :entered_groups, class_name: "GroupPlayer", foreign_key: :player_id
  has_many :groups, through: :entered_groups, source: :group

  has_many :played_matches_1, class_name: "Match", foreign_key: :player1_id
  has_many :played_matches_2, class_name: "Match", foreign_key: :player2_id
  has_many :won_matches, class_name: "Match", foreign_key: :winner_id
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id

end
