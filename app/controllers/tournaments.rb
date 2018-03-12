get '/tournaments' do
  @tournaments = Tournament.all
  erb :'tournaments/index'
end

get '/tournaments/new' do
  @tournament = Tournament.new
  erb :'tournaments/new'  
end

get '/tournaments/:id' do
  @tournament = Tournament.find_by(id: params[:id])
  erb :'tournaments/show'  
end