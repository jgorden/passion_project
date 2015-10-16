enable :sessions

get '/' do
  erb :index
end

get '/tables/batters/:year' do
  @batters = Batter.where("ab > ? AND year = ?",20,params[:year].to_i)
  erb :batters
end

get '/tables/pitchers/:year' do
  @pitchers = Pitcher.where(year: params[:year].to_i)
  erb :pitchers
end

post "/tables/pitchers" do
  redirect "/tables/pitchers/#{params[:year]}"
end

post "/tables/batters" do
  redirect "/tables/batters/#{params[:year]}"
end

get '/tables/pitchers/relievers/:year' do
  @pitchers = Pitcher.where("ipouts < ? AND year = ?",210,params[:year].to_i)
  erb :pitchers
end

get '/tables/pitchers/starters/:year' do
  @pitchers = Pitcher.where("ipouts > ? AND year = ?",210,params[:year].to_i)
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
    sig = (year[field] - starters.average(field).to_f)/standard_deviation(collection, starters.average(field).to_f)

    if negative.include?(field)
      sig = -sig
    end

    result << sig
  end
end

post '/players/batters/:id/charts' do
  master = Master.find(params[:id])
  year = master.batters.find_by(year: params[:year])
  all = Batter.where(year: params[:year])
  starters = all.where('ab > ?', 50)
  fields = [params[:field1], params[:field2], params[:field3], params[:field4], params[:field5]]
  result = []
  fields.each do |field|
    collection = []

    starters.each do |batter|
      collection << batter[field]
    end

    negative = ['cs', 'so', 'gidp']
    sig = (year[field] - starters.average(field).to_f)/standard_deviation(collection, starters.average(field).to_f)

    if negative.include?(field)
      sig = -sig
    end

    result << sig
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
