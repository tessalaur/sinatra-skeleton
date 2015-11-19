before do
  redirect "/login" unless current_user || request.path == "/signup" || request.path == "/login"
end

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

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/profile' do
  erb :profile
end

post '/profile' do
  redirect '/'
end

#render the form to create a new sighting
get "/sightings/new" do
  erb :new_sighting
end

#handle the post from abouve route to create
# object from params and populate the table
post "/sightings/create" do
  species = params[:species]
  user_confidence = params[:user_confidence]
  location_desc = params[:location_desc]
  animalnumber = params[:animalnumber]
  vessel = [:vessel]

  new_sighting = current_user.sightings.create(species: species,
              user_confidence: user_confidence,
              location_desc: location_desc,
              animalnumber: animalnumber,
              vessel: vessel)
  
    redirect "/sightingslist"
  end

get "/sightingslist" do
  erb :sightingslist
end


get "/sightings/:id" do
  @sighting = Sighting.find(params[:id])
  erb :sightingslist
end

