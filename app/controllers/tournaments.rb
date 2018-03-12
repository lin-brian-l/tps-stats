get '/tournaments' do
  @tournaments = Tournament.all
  erb :'tournaments/index'
end