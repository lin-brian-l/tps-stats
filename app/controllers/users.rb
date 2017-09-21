get '/register' do
  erb :'user/register'
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    user.password = user[:encrypted_password]
    user.save!
    redirect '/login'
  else
    @errors = user.errors.full_messages
    erb :'user/register'
  end
end

get '/login' do
  erb :'user/login'
end

post '/login' do
  p params[:encrypted_password]
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
