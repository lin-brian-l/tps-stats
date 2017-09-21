# new
get '/users/new' do
  erb :'users/new'
end

# create
post '/users' do
  user = User.new(params[:user])
  user.save
  redirect '/'
end

get '/users/login' do
  erb :"users/login"
end
