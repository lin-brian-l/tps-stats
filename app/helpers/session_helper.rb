def logged_in?
  !session[:user_id].nil?
end

def authenticate!
  redirect '/sessions/new' unless logged_in?
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def authorized?(owner)
  current_user == owner
end

def authorize!(owner)
  redirect '/entries' unless authorized?(owner)
end
