get '/session' do
  erb :'user/login'
end

post '/session' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:encrypted_password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = "Your username and/or password is incorrect!"
    erb :'user/login'
  end
end

get '/logout' do
  session.delete(:user_id)

  redirect '/login'
end
