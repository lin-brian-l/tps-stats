# route handlers dealing with the collection
get '/entries' do
  @entries = Entry.most_recent
  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] += 1

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

get '/entries/new' do
  if current_user
    erb :'entries/new'
  else
    erb :'404'
  end
end

get '/entries/:id' do
  @entry = find_and_ensure_entry(params[:id])
  @author = User.find_by(id: @entry.author_id)
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
  if current_user
    @entry = find_and_ensure_entry(params[:id])
    erb :'entries/edit'
  else
    erb :'404'
  end
end
