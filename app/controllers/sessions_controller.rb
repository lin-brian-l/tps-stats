get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions/new' do
  user = User.find_by(username: params[:username])
    if user.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect '/entries'
    else
      status 401
      @errors = "status"
      erb :'/sessions/new'
    end
end

get '/sessions' do
  session.delete(:user_id)
  redirect '/entries'
end
