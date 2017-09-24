get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    user.password = params[:user][:password]
    user.save!
    redirect '/sessions/new'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.where(id: params[:id])
  if @user.empty?
    erb :'/404'
  else
    @user = @user[0]
    erb :'/users/show'
  end
end

# get '/users/:id/entries' do
#   @user = User.find(params[:id])
#   erb :'/users/show'
# end



