# new
get '/users/new' do
  erb :'users/new'
end

# create
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    status 403
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/login' do
  erb :"users/login"
end
