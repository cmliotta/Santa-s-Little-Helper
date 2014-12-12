get '/' do  #welcome page
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/group' do
  erb :home
end
