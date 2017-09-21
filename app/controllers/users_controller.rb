get '/register' do
  @user = User.new
  erb :'users/new'
end

post '/register' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/entries'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
