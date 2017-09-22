module EntryControllerHelper
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    halt(404, erb(:'404')) if entry.nil?
    entry
  end
end

def find_and_authenticate_user(entry)
  @entry = entry
  halt(404, erb(:'404')) if session[:user_id].nil? || @entry.user.nil? || @entry.user.id != session[:user_id]
end

def authenticate_id(id)
  @entry = Entry.find_by(id: id)
  if session[:user_id].nil? || @entry.user.nil? || @entry.user.id != session[:user_id]
    false
  else
    @entry.user.username
  end
end

def find_and_ensure_user(id)
  user = User.find_by(id: id)
  halt(404, erb(:'404')) if user.nil? || user.entries.empty?
  user
end

helpers EntryControllerHelper
