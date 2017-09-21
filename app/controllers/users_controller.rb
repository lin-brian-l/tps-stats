get '/register' do
  erb :"users/register"
end

post '/register' do
  @user = User.create(params[:user])
  redirect '/entries'
end

# get '/login' do
#   erb :login
# end

# post
