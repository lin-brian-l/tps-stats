class Player < ApplicationRecord
  belongs_to :user

  has_many :placings, class_name: "EventEntrant"
  has_many :events, through: :placings
  has_many :tournaments, through: :events
  has_many :phases, through: :events
  has_many :groups, through: :phases

  has_many :played_matches_1, class_name: "Match", foreign_key: :player1_id
  has_many :played_matches_2, class_name: "Match", foreign_key: :player2_id
  has_many :won_matches, class_name: "Match", foreign_key: :winner_id
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id

  def played_matches
    played_matches_1.or(played_matches_2)
  end

  def matches_against(opponent_id)
    self.played_matches.select { |match| match.player1_id == opponent_id || match.player2_id == opponent_id }
  end

  def match_record(opponent_id, matches)
    wins = matches.select { |match| match.winner_id == self.id }.count
    losses = matches.select { |match| match.loser_id == self.id }.count
    return "#{wins}-#{losses}"
  end

  def no_dq(match_array)
    match_array.select { |played_match| played_match.loser_id != nil }
  end

  def query_played_matches(query, id)
    valid_queries = ["group", "phase", "event", "tournament"]
    return false unless valid_queries.include?(query)
    self.played_matches.select { |match| match.send(query).id == id }
  end

  def full_tag
    sponsor = self.sponsor || ""
    return sponsor + " | " + self.gamer_tag if sponsor.length > 0
    return self.gamer_tag
  end

  def top_8_placings
    self.placings.select { |placing| placing.placing <= 8 }
  end

  def top_3_placings
    self.placings.select { |placing| placing.placing <= 3 }
  end

  def nth_placings(number)
    self.placings.select { |placing| placing.placing == number }
  end

end
