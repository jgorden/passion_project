enable :sessions

get '/' do
  erb :index
end

get '/tables/fielders' do
  @batters = Batter.where("ab > ? AND year = ?",20,2014)
  erb :batters
end

get '/tables/pitchers' do
  @pitchers = Pitcher.where(year: 2014)
  erb :pitchers
end

get '/tables/pitchers/relievers' do
  @pitchers = Pitcher.where("ipouts < ? AND year = ?",210,2014)
  erb :pitchers
end

get '/tables/pitchers/starters' do
  @pitchers = Pitcher.where("ipouts > ? AND year = ?",210,2014)
  erb :pitchers
end

post '/players/pitchers/:id/charts' do
  master = Master.find(params[:id])
  year = master.pitchers.find_by(year: params[:year])
  all = Pitcher.where(year: params[:year])
  starters = all.where('ipouts > ?', 210)
  fields = [params[:field1], params[:field2], params[:field3], params[:field4], params[:field5]]
  result = []
  fields.each do |field|
    collection = []

    starters.each do |pitcher|
      collection << pitcher[field]
    end

    negative = ['l', 'h', 'er', 'hr', 'bb', 'baopp', 'era', 'ibb', 'wp', 'hbp', 'bk', 'r', 'sf', 'bb_nine']
    r = (year[field] - starters.average(field).to_f)/standard_deviation(collection, starters.average(field).to_f)

    if negative.include?(field)
      r = -r
    end

    result << r
  end

  { player_data: {"#{params[:field1]}" => result[0], "#{params[:field2]}" => result[1], "#{params[:field3]}" => result[2], "#{params[:field4]}" => result[3], "#{params[:field5]}" => result[4]}, average: [starters.average(params[:field1]).to_f, starters.average(params[:field2]).to_f, starters.average(params[:field3]).to_f, starters.average(params[:field4]).to_f, starters.average(params[:field5]).to_f]}.to_json
end

get '/charts' do
  erb :chart
end

get '/players/pitchers/:id' do
  @master = Master.find(params[:id])
  erb :pitcher_page
end

get '/players/batters/:id' do
  @master = Master.find(params[:id])
  erb :batter_page
end
