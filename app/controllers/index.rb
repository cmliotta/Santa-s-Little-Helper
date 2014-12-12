get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

# login and create session
get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/group/#{user.id}"
  else
    redirect '/'
  end
end

# log out
delete '/group/:user_id' do
  session.delete(:user_id)
  redirect '/'
end

get '/group/:user_id' do
  if session[:user_id]
    @all_users = User.all
    @user = User.find(params[:user_id])
    erb :group
  else
    redirect '/'
  end
end

#----------- USERS -----------

get '/users/new' do
  erb :signup
end

post '/users' do
  User.create!(params[:user])
  redirect to '/login'
end
