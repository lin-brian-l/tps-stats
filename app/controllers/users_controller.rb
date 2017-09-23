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
  @authors = User.all

  @author = User.find_by(id: params[:id])
  if @author.nil?
    halt(404, erb(:'404'))
  else
    erb :"users/show"
  end
end
