get '/sessions' do
  erb
end

get '/login' do
  erb :"sessions/new"
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    status 401
    @errors = ["Login email or password error"]
    erb :'sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end
