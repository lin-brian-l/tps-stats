# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
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

get '/error' do
  erb :'404'
end

before '/entries/new' do
  redirect '/error' unless session[:user_id]
end

get '/entries/new' do
  erb :'entries/new'
end

get '/entries/:id' do
  @user = User.find_by(entry_id: params[:id])
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/show'
end

put '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

before '/entries/:id/edit' do
  user = User.find_by(entry_id: params[:id])
  redirect '/error' unless session[:user_id] == user.id
end

delete '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.destroy
  redirect '/entries'
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/edit'
end
