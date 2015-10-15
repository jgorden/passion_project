enable :sessions

get '/' do
  erb :index
end

get '/tables/fielders' do
  @master = Master.all
  erb :fielders
end

get '/tables/pitchers' do
  @pitchers = Pitcher.where(yearID: 2014)
  erb :pitchers
end

post '/players/:id/charts' do
  p '*'*98
  p params
  p '*'*98
  master = Master.find(params[:id])
  year = master.pitchers.find_by(yearID: params[:year])
  p year
  a = year.pluck(params[:field1], params[:field2], params[:field3], params[:field4], params[:field5])
  p '*'*98
  p a
  p '*'*98
  # params.to_json
end

get '/charts' do
  erb :chart
end

get '/players/:id' do
  @master = Master.find(params[:id])
  erb :player_page
end
