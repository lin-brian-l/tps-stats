

get '/users' do
  erb :'users/user_index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new_user'
end

post '/users' do
  @user = User.create(params[:users])
  redirect '/users'
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/entries'
  else
    redirect '/users'
  end

end

##ensure only logged in users can access restricted page
get '/entries' do
  if session[:user_id] == nil
    redirect '/users/login'
  else
    erb :entries
 end
end

get '/session-viewer' do
  session.inspect
end




##TODO, begin restricting access
##SETUP FEEDBACK loop if errors occur on login page

