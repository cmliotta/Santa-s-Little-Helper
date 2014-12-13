# render home page
get '/' do
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
  elsif user == nil
    redirect '/?error=username'
  elsif !user.authenticate(params[:password])
    redirect '/?error=password'
  end
end

# log out
delete '/group/:user_id' do
  session.delete(:user_id)
  redirect '/'
end

get '/group/:user_id' do
  if params[:user_id].to_i == session[:user_id]
    @user = User.find(params[:user_id])
    @all_users = User.all
    erb :group
  else
    session.delete(:user_id)
    redirect '/'
  end
end

#----------- USERS -----------

get '/users/new' do
  erb :signup
end

post '/users' do
  User.create!(params[:user])
  # If email is duplicated,
  # redirect to '/?error=username'
  # else
  redirect to '/login'
end
