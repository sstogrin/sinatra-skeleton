# Helpers
helpers do

  # access sinatra sessions current user
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

# get the login page
get '/login' do
  erb :login
end

# submit the login page
post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)
  if user != nil 
    if user.password == password
      session[:user_id] = user.id # save user id in the session
      redirect '/'  # go to the home page for now
    else
    end
  end
  session[:error] = "Email or password is incorrect"
  redirect '/login' # go back to the login page
end

# get the logout page?
get '/logout' do
  erb :logout
end

put '/logout' do
  redirect '/'  # go to the home page for now
end

# get the signup page
get '/signup' do
  erb :signup
end

# submit the signup page
post '/signup' do
  email = params[:email]
  user = User.find_by(email: email)
  if user != nil
    redirect '/login' # user already exists, make them log in
  else
    password = params[:password]
    username = params[:username]
    user = User.create(email: email, password: password, username: username)
    if user != nil
      session[:user_id] = user.id
      redirect '/' # go to main page
    else
      redirect '/signup' # try again
    end
  end
end

# get the profile page
get '/profile' do
  erb :profile
end

# submit change from the profile page
post '/profile' do
  redirect '/' # go to home page for now
end

# get routine for editing user profile data
get '/profile/edit' do
  current_user  # get the current user
  erb :profile
end

# post routine for updating user profile data
post '/profile/edit' do
  username = params[:username]
  email = params[:email]
  password = params[:password]
  current_user.update(username: username, email: email, password: password)

  redirect "/"  # back to the home page
end


# show info for the current movie
get '/movie' do
  erb :movie
end


# get the create movie page
get '/movies/new' do
  erb :new_movie
end

# page for a specific movie
get '/movies/:id' do
  @movie = Movie.find(params[:id])
  if @movie != nil
    erb :movie
  end
  # redirect somewhere else?
end


# submit a new movie to the database
post '/movies/new' do
  user = current_user
  if user != nil
    @movie = user.movies.create(title: params[:title], director: params[:director], country: params[:country], synopsis: params[:synopsis], run_length: params[:run_length], mpaa_rating: params[:mpaa_rating], release_date: params[:release_date])
    if @movie != nil
      redirect "/movies/#{@movie.id}"  # go to the page for this movie
    end
  end

  redirect '/movies/new' # back to this page by default
end


