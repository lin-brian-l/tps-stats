get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.create(params[:register])
  redirect '/entries'
end

get '/users/login' do
  erb :'users/login'
end
