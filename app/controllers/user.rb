get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/profile"
end

post '/users' do
  user = User.create(params[:user])

  redirect "/users/#{user.id}"
end
