def logged_in?
  !session[:user_id].nil?
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def is_admin?(current_user)
  current_user.admin
end

def authorize!()
  redirect '/tournaments' unless logged_in? && is_admin?(current_user)  
end

def get_suffix(placing)
  return "th" if (placing.between?(4,20))
  case placing.digits.first
    when 1
      "st"
    when 2
      "nd"
    when 3
      "rd"
    else
      "th"
  end
end