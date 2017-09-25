get '/sessions-checker' do
  p current_user
  session.inspect
end

get '/login' do
  erb :'sessions/new'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/entries'
  else
    status 401
    @errors = ['Invalid username or password']
    erb :'sessions/new'
  end
end

delete '/logout' do
  session.delete(:user_id)
  redirect '/entries'
end


get '/404' do
  erb :'404'
end
