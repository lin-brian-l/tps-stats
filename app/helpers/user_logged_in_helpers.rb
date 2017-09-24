module CurrentUser
  def logged_in?
    session[:user_id]
  end

  def current_user?(user)
    session[:user_id] == user.id
  end
end

helpers CurrentUser
