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
    redirect "/users/#{@user.id}"
  else
    @errors = "status"
    erb :'/users/login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
