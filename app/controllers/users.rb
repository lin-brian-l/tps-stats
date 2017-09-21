get '/user/new' do
  erb :'user/register'
end

post '/user/new' do
  user = User.new(params[:user])
  if user.save
    user.password = user[:encrypted_password]
    user.save!
    redirect '/login'
  else
    @errors = user.errors.full_messages
    erb :'user/register'
  end
end

get '/users/:id/entries' do
  @user = User.find_by(id: params[:id])
  if @user.nil?
    redirect '/error'
  else
    p @user
    @entry = Entry.where(:user_id => params[:id])
    erb :'user/entries'
  end
end
