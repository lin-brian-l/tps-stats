# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

get '/users/:id/entries' do
  if User.find_by(id: params[:id])
    @entries = Entry.where(author_id: params[:id])
    erb :'entries/index'
  else
    erb :'404'
  end
end

post '/users/:id/entries' do
  @entry = Entry.new(params[:entry])
  @entry.author_id = current_user.id
  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end
before '/entries/new' do
  redirect "/404" if !current_user
end
get '/entries/new' do
  erb :'entries/new'
end

get '/entries/:id' do
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

delete '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @entry.destroy
  redirect '/entries'
end

before '/entries/:id/edit' do
  redirect '/404' if !current_user
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/edit'
end
