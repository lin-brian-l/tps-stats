get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.new(params[:user])
  if user.save
    redirect '/entries'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'/users/login'
end

get '/users/logout' do
  session.delete(:user_id)
  redirect '/users/login'
end

post '/users/login' do
  @our_errors = []
  if params[:email].empty? || params[:encrypted_password].empty?
    @our_errors << "Gimme a fricken email!" if params[:email].empty?
    @our_errors << "Password can't be blank, dummy!" if params[:encrypted_password].empty?
    erb :'users/login'
  elsif User.authenticate(params[:email], params[:encrypted_password])
    user = User.find_by(:email => params[:email])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @our_errors << "Email and password don't match! Too band :(."
    erb :'users/login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end







