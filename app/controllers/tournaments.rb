require "http"

get '/tournaments' do
  @tournaments = Tournament.all
  erb :'tournaments/index'
end

get '/tournaments/new' do
  @link = ""
  erb :'tournaments/new'  
end

get '/tournaments/:id' do
  @tournament = Tournament.find_by(id: params[:id])
  erb :'tournaments/show'  
end

post '/tournaments' do
  @link = params[:tournament][:link]
  link = /(?<=tournament\/)(.+)[\d]/.match(@link)
  @http = HTTP.get("https://api.smash.gg/tournament/" + link[0] + "?expand[]=phase&expand[]=groups&expand[]=event")
  json_obj = JSON.parse(@http)
  tournament_obj = json_obj["entities"]["tournament"]
  # print tournament_obj["id"].class
  print "******************" + "found" + "***************" if Tournament.find_by(id: tournament_obj["id"])
  if !Tournament.find_by(id: tournament_obj["id"])
    if !save_tournament(tournament_obj)
      @error = "Tournament failed to save."
      return erb :'tournaments/new'
    end
  else
    @error = "A tournament with ID #{tournament_obj['id']} already exists."
    return erb :'tournaments/new'
  end

  event_array = json_obj["entities"]["event"]
  event_array.each do |event|
    if !Event.find_by(id: event["id"])
      if !save_event(event)
        @error = "The event named #{event['name']} failed to save."
        return erb :'tournaments/new'
      end
    else 
      @error = "An event with ID #{event['id']} already exists."
      return erb :'tournaments/new'
    end
  end

  phase_array = json_obj["entities"]["phase"]
  phase_array.each do |phase|
    if !Phase.find_by(id: phase["id"])
      if !save_phase(phase)
        @error = "The phase with name #{phase["name"]}, ID #{phase["id"]}, and event ID #{phase["eventId"]} failed to save."
        return erb :'tournaments/new'
      end
    else
      @error = "A phase with ID #{phase["id"]} already exists."
      return erb :'tournaments/new'
    end
  end

  group_array = json_obj["entities"]["groups"]
  group_array.each do |group|
    if !Group.find_by(id: group["id"])
      if !save_group(group)
        @error = "The group with name #{group["displayIdentifier"]}, ID #{group["id"]}, and phase ID #{phase["phaseId"]} failed to save."
        return erb :'tournaments/new'
      end
    else
      @error = "A group with ID #{group["id"]} already exists."
      return erb :'tournaments/new'
    end
  end

  erb :'tournaments/test'
  # puts params[:tournament][:link]
  # puts json_obj
  # puts json_obj["entities"]["tournament"]["id"]
end

def save_tournament(tournament)
  tournament_hash = {
    "id": tournament["id"],
    "name": tournament["name"],
    "date": Time.at(tournament["startAt"]),
    "link": "https://smash.gg/" + tournament["slug"]
  }
  tournament = Tournament.new(tournament_hash)
  tournament.save  
end

def save_event(event)
  event_hash = {
    "id": event["id"],
    "tournament_id": event["tournamentId"],
    "name": event["name"],
    "smash_gg_link": "https://smash.gg" + event["slug"]
  }
  event = Event.new(event_hash)
  event.save
end

def save_phase(phase)
  phase_hash = {
    "id": phase["id"],
    "event_id": phase["eventId"],
    "name": phase["name"]
  }
  phase = Phase.new(phase_hash)
  phase.save  
end

def save_group(group)
  group_hash = {
    "id": group["id"],
    "phase_id": group["phaseId"],
    "name": group["displayIdentifier"]
  }
  group = Group.new(group_hash)
  group.save
end