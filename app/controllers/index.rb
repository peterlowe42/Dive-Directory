get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  error = ''
  user = User.authenticate(params[:email], params[:password])
 if user == false
   @error = "Invalid username and password combination. Please try again."
   erb :login
 else
   session[:user_id] = user.id
   redirect "/users/#{user.id}"
 end
end

post '/logout' do
  session.clear
  redirect '/'
end
