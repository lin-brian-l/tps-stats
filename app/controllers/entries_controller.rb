# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

post '/entries' do
  if logged_in?
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect "/entries/#{@entry.id}"
    else
      @errors = @entry.errors.full_messages
      erb :'entries/new'
    end
  else
    @errors = "Must be logged in to make a new entry!"
    erb :'users/login'
  end
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

get '/entries/:id/edit' do
  @entry = find_and_ensure_entry(params[:id])
  if @current_user == @entry.id
    erb :'entries/edit'
  end
end
