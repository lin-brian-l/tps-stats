get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  redirect '/sessions/new'
end
