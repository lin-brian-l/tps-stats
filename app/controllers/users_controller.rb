get '/users/new' do
  @entry = Entry.first
  erb :'users/new'
end

post '/users' do
  User.create(params[:user])
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  username = params[:user][:user_name]
  password = params[:user][:password]
  if User.authenticate(username, password)
      session[:id] = User.i_am(username,password)
      "#{session[:id]}"
      redirect '/'
  else
    'nope'
  end
end

get '/logout' do
  session[:id] = nil
 redirect 'entries'
end