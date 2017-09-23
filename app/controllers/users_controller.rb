get '/register' do
  erb :"users/new"
end

post '/register' do
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect '/entries'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id/entries' do
  # @author = User.find(params[:id])
  # @entry = Entry.find_by(@author.id)

  erb :"users/user_entries"
end
