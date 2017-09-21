get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.new(params[:user])
  if user.save
    redirect '/entries'
  else
    p user.errors
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'/users/login'
end
