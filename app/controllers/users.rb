get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}?welcome=true"
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @welcome = "You have successfully registered your account! Enjoy your stay!" if params[:welcome]
  @user = User.find_by(id: params[:id])
  @entries = @user.entries
  erb :'users/show'
end
