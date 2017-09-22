get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  p params
  @user = User.create(params[:register])
  redirect '/entries'
end

get '/users/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    redirect '/entries'
  end
end
