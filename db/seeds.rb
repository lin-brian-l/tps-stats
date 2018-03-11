# players = [
#   { :gamer_tag => "metroid",
#     :sponsor => "" },
#   { :gamer_tag => "Nave",
#     :sponsor => "" },
#   { :gamer_tag => "Kels",
#     :sponsor => "GHQ" },
#   { :gamer_tag => "Drugfreechu",
#     :sponsor => "" }
# ]

# Player.create!(players)

# tournament = {
#   :name => "Testing1",
#   :date => "3/2/18",
#   :link => "asdfasdf"
# }

# Tournament.create(tournament)

# # Player.all.each do |player| 
# #   TournamentAttendee.create(tournament_attendee)
# #   player.attended_tournaments << TournamentAttendee.last
# # end

# events = [
#   { name: "Melee Singles" }, { name: "Project M Singles" }
# ]

# events.each do |event|
#   Event.create(event)
#   Tournament.first.events << Event.last
# end

# # Player.all.each do |player|
# #   Event.all.each do |event| 
# #     EventEntrant.create();
# #     event.event_entrants << EventEntrant.last
# #     player.entered_events << EventEntrant.last
# #   end
# # end

# Event.all.each do |event|
#   Phase.create(name: "Bracket")
#   event.phases << Phase.last
# end

# # Player.all.each do |player|
# #   Phase.all.each do |phase| 
# #     PhasePlayer.create();
# #     phase.phase_players << PhasePlayer.last
# #     player.entered_phases << PhasePlayer.last
# #   end
# # end

# Phase.all.each do |phase|
#   Group.create(name: "Bracket")
#   phase.groups << Group.last
# end

# # Player.all.each do |player|
# #   Group.all.each do |group| 
# #     GroupPlayer.create();
# #     group.group_players << GroupPlayer.last
# #     player.entered_groups << GroupPlayer.last
# #   end
# # end

# matches_PM = [
#   { round_short: "WS",
#     round_full: "Winners Semis",
#     player1_id: 1,
#     player2_id: 2,
#     winner_id: 1,
#     loser_id: 2,
#     winner_score: 3,
#     loser_score: 2
#   },
#   { round_short: "WS",
#     round_full: "Winners Semis",
#     player1_id: 3,
#     player2_id: 4,
#     winner_id: 4,
#     loser_id: 3,
#     winner_score: 3,
#     loser_score: 0
#   },
#   { round_short: "WF",
#     round_full: "Winners Finals",
#     player1_id: 1,
#     player2_id: 4,
#     winner_id: 4,
#     loser_id: 1,
#     winner_score: 3,
#     loser_score: 1
#   },
#   { round_short: "LS",
#     round_full: "Losers Semis",
#     player1_id: 2,
#     player2_id: 3,
#     winner_id: 2,
#     loser_id: 3,
#     winner_score: 3,
#     loser_score: 2,
#     loser_placing: 4
#   },
#   { round_short: "LF",
#     round_full: "Losers Finals",
#     player1_id: 1,
#     player2_id: 2,
#     winner_id: 2,
#     loser_id: 1,
#     winner_score: 3,
#     loser_score: 1,
#     loser_placing: 3
#   },
#   { round_short: "GF1",
#     round_full: "Grand Finals 1",
#     player1_id: 4,
#     player2_id: 2,
#     winner_id: 2,
#     loser_id: 4,
#     winner_score: 3,
#     loser_score: 2
#   },
#   { round_short: "GF2",
#     round_full: "Grand Finals 2",
#     player1_id: 4,
#     player2_id: 2,
#     winner_id: 2,
#     loser_id: 4,
#     winner_score: 3,
#     loser_score: 0,
#     loser_placing: 2,
#     winner_placing: 1
#   }
# ]

# matches_PM.each do |match|
#   Match.create(match)
#   Group.second.matches << Match.last
# end

# matches_melee = [
#   { round_short: "WS",
#     round_full: "Winners Semis",
#     player1_id: 1,
#     player2_id: 2,
#     winner_id: 1,
#     loser_id: 2,
#     winner_score: 3,
#     loser_score: 0
#   },
#   { round_short: "WS",
#     round_full: "Winners Semis",
#     player1_id: 3,
#     player2_id: 4,
#     winner_id: 3,
#     loser_id: 4,
#     winner_score: 3,
#     loser_score: 0
#   },
#   { round_short: "WF",
#     round_full: "Winners Finals",
#     player1_id: 1,
#     player2_id: 4,
#     winner_id: 3,
#     loser_id: 1,
#     winner_score: 3,
#     loser_score: 0
#   },
#   { round_short: "LS",
#     round_full: "Losers Semis",
#     player1_id: 2,
#     player2_id: 4,
#     winner_id: 4,
#     loser_id: 2,
#     winner_score: 3,
#     loser_score: 1,
#     loser_placing: 4
#   },
#   { round_short: "LF",
#     round_full: "Losers Finals",
#     player1_id: 1,
#     player2_id: 4,
#     winner_id: 1,
#     loser_id: 4,
#     winner_score: 3,
#     loser_score: 2,
#     loser_placing: 3
#   },
#   { round_short: "GF1",
#     round_full: "Grand Finals 1",
#     player1_id: 3,
#     player2_id: 1,
#     winner_id: 3,
#     loser_id: 1,
#     winner_score: 3,
#     loser_score: 0,
#     loser_placing: 2,
#     winner_placing: 1
#   }
# ]

# matches_melee.each do |match|
#   Match.create(match)
#   Group.first.matches << Match.last
# end

# melee_matches = Event.first.matches
# melee_matches.each do |match|
#   if match.loser_placing
#     EventEntrant.create(event_id: 1, placing: match.loser_placing, player_id: match.loser_id);
#   end
#   if match.winner_placing
#     EventEntrant.create(event_id: 1, placing: match.winner_placing, player_id: match.winner_id)
#   end
# end

# pm_matches = Event.second.matches
# pm_matches.each do |match|
#   if match.loser_placing
#     EventEntrant.create(event_id: 2, placing: match.loser_placing, player_id: match.loser_id);
#   end
#   if match.winner_placing
#     EventEntrant.create(event_id: 2, placing: match.winner_placing, player_id: match.winner_id)
#   end
# end