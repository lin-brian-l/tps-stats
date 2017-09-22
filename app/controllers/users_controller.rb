get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.create(params[:register])
  if @user
    redirect 'users/login'
  else
    @errors = "status"
    erb '/users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:username] = @user.username
    redirect "/users/#{@user.username}"
  else
    @errors = "status"
    erb :'/users/login'
  end
end

get '/users/:username' do
  if session[:username] == params[:username]
    @user = User.find_by(username: params[:username])
    erb :'users/show'
  else
    redirect '/users/login'
  end
end

get '/logout' do
  session[:username] = nil
  redirect '/entries'
end
