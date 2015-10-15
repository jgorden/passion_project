enable :sessions

get '/' do
  erb :index
end

get '/tables/fielders' do
  @master = Master.all
  erb :fielders
end

get '/charts' do
  erb :chart
end

get '/players/:p_id' do

end
