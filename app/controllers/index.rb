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
  master = Master.find(params[:id])
  year = master.pitchers.find_by(yearID: params[:year])
  all = Pitcher.where(yearID: params[:year])
  starters = all.where('ipouts > ?', 210)
  collection = []

  starters.each do |pitcher|
    collection << pitcher[params[:field1]]
  end
  p '*'*143
  p collection
  p starters.average(params[:field1]).to_f
  p standard_deviation(collection, starters.average(params[:field1]).to_f)
  p '*'*143
  p (year[params[:field1]] - starters.average(params[:field1]).to_f)/standard_deviation(collection, starters.average(params[:field1]).to_f)
  max = starters.order("#{params[:field1]} DESC").first[params[:field1]]
  min = starters.order("#{params[:field1]} ASC").first[params[:field1]]
  { player_data: {"#{params[:field1]}" => year[params[:field1]], "#{params[:field2]}" => year[params[:field2]], "#{params[:field3]}" => year[params[:field3]], "#{params[:field4]}" => year[params[:field4]], "#{params[:field5]}" => year[params[:field5]]}, average: [starters.average(params[:field1]).to_f, starters.average(params[:field2]).to_f, starters.average(params[:field3]).to_f, starters.average(params[:field4]).to_f, starters.average(params[:field5]).to_f]}.to_json
  # p all.average(params[:field5]).to_f
end

get '/charts' do
  erb :chart
end

get '/players/:id' do
  @master = Master.find(params[:id])
  erb :player_page
end
