# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  authenticate!
  @entry = Entry.new(params[:entry])

  if @entry.save
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/new' do
  authenticate!
  erb :'entries/new'
end

get '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/show'
end

put '/entries/:id' do
  authenticate!
  @entry = find_and_ensure_entry(params[:id])
  authorize!(@entry.author_id)
  @entry.assign_attributes(params[:entry])

  if @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  authenticate!
  @entry = find_and_ensure_entry(params[:id])
  authorize!(@entry.author_id)
  @entry.destroy
  redirect '/entries'
end

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  erb :'entries/edit'
end
