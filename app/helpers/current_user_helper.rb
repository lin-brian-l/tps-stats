helpers do
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    # google !!
    !!@current_user
  end

  def authenticate!
    redirect '/login' unless logged_in?
  end
end

