get '/sessions' do
  session.inspect
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @errors = "Try Again!"
    erb :'users/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

