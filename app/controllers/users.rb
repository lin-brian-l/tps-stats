get '/users/login' do
  erb :login
end

get '/users/new' do
  erb :new
end

post '/users/new' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    redirect '/entries'
  else
    @errors = @user.errors.full_messages
    erb :new
  end
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
