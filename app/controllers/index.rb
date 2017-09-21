get '/' do
  redirect '/entries'
end

get '/login' do
  erb :login
end

get '/register' do
  erb :register
end
