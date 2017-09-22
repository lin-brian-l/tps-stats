get '/sign_up' do
  erb :'users/new'
end

post '/sign_up' do
  @user = User.new( params[:user] )

  if @user.save
    # session[:user_id] = @user.id
    p "I was saved"
    redirect "/user/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
