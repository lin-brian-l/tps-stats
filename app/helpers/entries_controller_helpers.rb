module EntryControllerHelper
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    halt(404, erb(:'404')) if entry.nil?
    entry
  end

  def UserEditAuth(id,entry)
    user = User.find_by(id: id)
    halt(404, erb(:'404')) if entry.author != user
    user
  end

end

helpers EntryControllerHelper
