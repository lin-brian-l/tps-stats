get '/login' do
  erb :'sessions/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @errors = "Please enter valid username or password!"
    erb :'users/login'
  end
end

delete '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

