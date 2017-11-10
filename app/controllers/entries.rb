get '/entries' do
  @entries = Entry.most_recent
  erb :'entries/index'
end

get '/entries/new' do
  authenticate!
  @entry = Entry.new
  erb :'entries/new'
end

post '/entries' do
  authenticate!
  @entry = Entry.new(params[:entry])
  @entry.user_id = session[:user_id]
  if @entry.save
    redirect "/entries/#{@entry.id}?created=true"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/:id' do
  @message = "Thanks for adding to this site!" if params[:created]
  @entry = Entry.find_by(id: params[:id])
  erb :'entries/show'
end

get '/entries/:id/edit' do
  authenticate!
  @entry = Entry.find(params[:id])
  authorize!(@entry.user)
  erb :'entries/edit'
end

put '/entries/:id' do
  authenticate!
  @entry = Entry.find(params[:id])
  authorize!(@entry.user)
  if @entry.update(params[:entry])
    redirect "/entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :"entries/edit"
  end
end

delete '/entries/:id' do
  authenticate!
  @entry = Entry.find(params[:id])
  authorize!(@entry.user)
  @entry.delete
  redirect "/entries"
end
