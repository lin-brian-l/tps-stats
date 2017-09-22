get '/session-viewer' do
  session.inspect
end

get '/login' do
  erb :"users/login"
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:user_id] = user.id
    redirect '/users'
  else
    erb :"users/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

