get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id/entries' do
  @user = User.find(params[:id])
  @entries = @user.entries
  erb :'users/show'
end