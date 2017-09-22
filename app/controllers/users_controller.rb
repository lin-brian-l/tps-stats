get '/user/:id' do
  if current_user
    redirect '/entries'
  else
    redirect '/login'
  end
end

# show all entries by single user
get '/user/:id/entries' do
  @user = User.find(params[:id])
  @entries = Entry.find_by(author_id: @user.id)
    erb :'users/show'
end
