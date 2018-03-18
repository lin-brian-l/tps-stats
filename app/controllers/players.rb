get '/players' do
  @players = Player.all.sort_by { |player| player.full_tag.capitalize }
  erb :'players/index'
end

get '/players/h2h' do
  @players = Player.all.sort_by { |player| player.full_tag.capitalize }
  erb :'players/h2h'
end

get '/players/:id' do
  @player = Player.find_by(id: params[:id]) 
  return erb :'404' if !@player 
  @tournaments = @player.tournaments.distinct.count
  @played_matches = @player.no_dq(@player.played_matches).count
  @won_matches = @player.no_dq(@player.won_matches).count
  @win_percent = percent(@won_matches, @played_matches)
  @top_8_placings = reverse_tournament_date(@player.top_8_placings)
  @placings = reverse_tournament_date(@player.placings)
  @match_array = @placings.map do |placing| 
    @player.query_played_matches("event", placing.event.id)
  end
  erb :'players/show'
end