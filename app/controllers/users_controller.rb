

get '/users' do
  erb :'users/user_index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new_user'
end

post '/users' do
  @user = User.new(params[:users])
  redirect '/users'
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  ##authenticate info goes here!
end


get '/session-viewer' do
  session.inspect
end

##TODO, finalize and test registration
##TODO, SETUP login route and form
##TODO, authenticate users
##TODO, begin restricting access


