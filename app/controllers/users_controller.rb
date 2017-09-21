get '/users/new' do
  erb :'users/new'
end

post '/users' do
  User.create(params[:user])
  redirect '/'
end

get '/users/login' do
  "Login please"
end
