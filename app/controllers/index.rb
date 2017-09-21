get '/session' do
  session.inspect
end

get '/' do
  redirect '/entries'
end




