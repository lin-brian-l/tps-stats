get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    @welcome = "You have successfully registered your account! Please log in!"
    redirect '/sessions/new'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end
