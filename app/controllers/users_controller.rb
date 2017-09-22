get '/register' do
  erb :"users/register"
end

post '/register' do
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect '/entries'
  else
    @errors = @user.errors.full_messages
    erb :"users/register"
  end
end

# get '/users' do
#   redirect '/login' unless session[:user_id]
