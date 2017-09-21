get '/register' do
  erb :"users/register"
end

post '/register' do
  @user = User.create(params[:user])
  redirect '/entries'
end

get '/login' do
  erb :"users/login"
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/entries'
  else
    erb :"users/login"
  end
end
