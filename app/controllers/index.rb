get '/' do
  redirect '/entries'
end

get '/login' do
  erb :login
end
