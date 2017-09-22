get '/user/:id' do
  # @user = User.find(params[:id])
  if current_user
    redirect '/entries'
  else
    redirect '/login'
  end
end
