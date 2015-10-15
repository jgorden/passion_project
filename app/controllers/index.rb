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
  fields = [params[:field1], params[:field2], params[:field3], params[:field4], params[:field5]]
  result = []
  fields.each do |field|
    collection = []

    starters.each do |pitcher|
      collection << pitcher[field]
    end

    negative = ['l', 'h', 'er', 'hr', 'bb', 'baopp', 'era', 'ibb', 'wp', 'hbp', 'bk', 'r', 'sf']
    r = (year[field] - starters.average(field).to_f)/standard_deviation(collection, starters.average(field).to_f)

    if negative.include?(field)
      r = -r
    end

    result << r
  end

  p result
  { player_data: {"#{params[:field1]}" => result[0], "#{params[:field2]}" => result[1], "#{params[:field3]}" => result[2], "#{params[:field4]}" => result[3], "#{params[:field5]}" => result[4]}, average: [starters.average(params[:field1]).to_f, starters.average(params[:field2]).to_f, starters.average(params[:field3]).to_f, starters.average(params[:field4]).to_f, starters.average(params[:field5]).to_f]}.to_json
  # p all.average(params[:field5]).to_f
end

get '/charts' do
  erb :chart
end

get '/players/:id' do
  @master = Master.find(params[:id])
  erb :player_page
end
