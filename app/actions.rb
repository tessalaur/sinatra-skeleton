helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user && (user.password == password)
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, password: password)
    session[:user_id] = user.id
    redirect '/'
  end 
end

get '/profile' do
  erb :profile
end

post '/profile' do
  redirect '/'
end


