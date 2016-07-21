get '/users/signup' do
  erb :'/users/signup'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/questions'
  else
    @errors = user.errors.full_messages
    erb :'/users/signup'
  end
end


get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
   user = User.find_by({:username => params[:username]})
   if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/questions'
  else
      @errors = ["Honey Grahams, your username and password don't match"]
      erb :'users/login'
    end
end

get '/users/signout' do
  session.clear
  redirect '/'
end
