# new
get '/users/new' do
  erb :'users/new'
end

# create
post '/users' do
  redirect # index
end

get '/users/login' do
  erb :"users/login"
end
