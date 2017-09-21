get '/register' do
  erb :'user/register'
end
# users/new
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

# session
get '/login' do
  erb :'user/login'
end

get '/users/:id/entries' do
  @user = User.find_by(id: params[:id])
  if @user.nil?
    redirect '/error'
  else
    p @user
    @entry = Entry.where(:user_id => params[:id])
    erb :'user/entries'
  end
end

post '/login' do
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
