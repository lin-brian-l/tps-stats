get '/users/login' do
  erb :login
end

get '/users/new' do
  erb :new
end

post '/users' do
  User.create(username: params[:username], email: params[:email], password: params[:password])
  redirect '/entries'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:username] = user.username
    redirect '/entries'
  else
    erb :login
  end
end

get '/users/logout' do
  session.delete(:username)
  session.delete(:user_id)
  redirect '/entries'
end
