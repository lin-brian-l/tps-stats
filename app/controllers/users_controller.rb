get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/entries/new' #should be '/users/@user.id'?
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/entries/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do

  if User.authenticate(params[:user][:username], params[:user][:password])
    @user = User.find_by(username: params[:user][:username])
    session[:user_id] = @user.id
    redirect '/entries/new'
  else
    status 422
    @errors = ["Invalid username and password combination"]
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.delete(:user_id)
  redirect '/users/login'
end
