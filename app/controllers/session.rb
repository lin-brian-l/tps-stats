get '/sessions/new' do
  erb :'session/new'
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if !user.nil? && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/entries'
  else
    @error = "Your email and password don't match!"
    erb :'/session/new'
  end
end

delete '/sessions' do
  session.delete("user_id")
  redirect '/entries'
end
