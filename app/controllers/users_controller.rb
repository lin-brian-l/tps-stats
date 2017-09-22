get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    user.password = params[:encrypted_password]
    user.save!
    redirect '/sessions/new'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

