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
  redirect '/'  # go to the home page for now
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
  redirect '/' # go to the home page for now
end

# get the profile page
get '/profile' do
  erb :profile
end

# submit change from the profile page
post '/profile' do
  redirect '/' # go to home page for now
end
