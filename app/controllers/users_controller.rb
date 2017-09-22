get '/register' do
  erb :"users/register"
end

post '/register' do
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    redirect "/users"
  else
    @errors = @user.errors.full_messages
    erb :"users/register"
  end
end

get '/users' do
  redirect '/login' unless session[:user_id]

  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] += 1

  erb :"users/index"
end
