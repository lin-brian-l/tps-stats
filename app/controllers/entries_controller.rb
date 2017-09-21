# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  @user = User.find_by(params[:email])
  erb :'entries/index'
end

get '/entries/new' do
  authenticate!
  if current_user
    erb :'entries/new'
  else
    @errors = ["You must be logged in"]
    erb :'sessions/new'
  end
end

post '/entries' do
  @entry = Entry.new(params[:entry])
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @user = User.find_by(params[:email])
  erb :'entries/show'
end

get '/entries/:id/edit' do
  authenticate!
  @entry = find_and_ensure_entry(params[:id])
  if current_user.id == @entry.user.id
    erb :'entries/edit'
  else
    erb :'404'
  end
end

put '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    status 422
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  if current_user && current_user.id == @entry.user_id
    @entry.destroy
    redirect '/entries'
  else
    @errors = ["You must be logged in"]
    erb :'sessions/new'
  end
end