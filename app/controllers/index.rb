enable :sessions

get '/' do
  erb :index
end

get '/tables/fielders' do
  @master = Master.all
  erb :fielders
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:u_id] = @user.id
  else
    halt 500, "who is you"
  end
  redirect "/channels/user/#{@user.id}"
end

post '/login/new' do
  User.create(params)
  redirect '/login'
end

get '/logout' do
  session[:u_id] = nil
  erb :index
end

