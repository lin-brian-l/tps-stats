module CurrentUser
  def current_user
    if session[:user_id] != nil
      current_user = User.find(session[:user_id])
    else
      nil
    end
  end
end

helpers CurrentUser
