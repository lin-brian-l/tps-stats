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

def reverse_tournament_date(array)
  array.sort_by { |element| element.tournament.date }.reverse
end