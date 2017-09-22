get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  p params
  @user = User.create(params[:register])
  redirect 'users/login'
end

get '/users/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect "/users/#{@user.id}"
  else
    @errors = "status"
    erb :'/users/login'
  end
end

get '/users/:id' do
  if session[:user_id] == params[:id].to_i
    @user = User.find(params[:id])
    erb :'users/show'
  else
    redirect '/users/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  session[:username] = nil
  redirect '/entries'
end
