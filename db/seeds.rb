require 'CSV'

CSV.readlines("db/lahman-csv_2015-01-24/Master.csv", headers:true).each do |line|
  Master.create(
  playerID: line[0],
  birthYear: line[1],
  birthMonth: line[2],
  birthDay: line[3],
  birthCountry: line[4],
  birthState: line[5],
  birthCity: line[6],
  deathYear: line[7],
  deathMonth: line[8],
  deathDay: line[9],
  deathCountry: line[10],
  deathState: line[11],
  deathCity: line[12],
  nameFirst: line[13],
  nameLast: line[14],
  nameGiven: line[15],
  weight: line[16],
  height: line[17],
  bats: line[18],
  throws: line[19],
  debut: line[20],
  finalGame: line[21],
  retroID: line[22],
  bbrefID: line[23]
  )
end

CSV.readlines("db/lahman-csv_2015-01-24/Batting.csv", headers:true).each do |line|
  master = Master.find_by(playerID: line[0])

  master.batters.create(
    playerID: line[0],
    year: line[1],
    stint: line[2],
    teamID: line[3],
    lgID: line[4],
    g: line[5],
    ab: line[6],
    r: line[7],
    h: line[8],
    double: line[9],
    triple: line[10],
    hr: line[11],
    rbi: line[12],
    sb: line[13],
    cs: line[14],
    bb: line[15],
    so: line[16],
    ibb: line[17],
    hbp: line[18],
    sh: line[19],
    sf: line[20],
    gidp: line[21]
  )
end

CSV.readlines("db/lahman-csv_2015-01-24/Pitching.csv", headers:true).each do |line|
  master = Master.find_by(playerID: line[0])

  master.pitchers.create(
    playerID: line[0],
    year: line[1],
    stint: line[2],
    teamID: line[3],
    lgID: line[4],
    w: line[5],
    l: line[6],
    g: line[7],
    gs: line[8],
    cg: line[9],
    sho: line[10],
    sv: line[11],
    ipouts: line[12],
    h: line[13],
    er: line[14],
    hr: line[15],
    bb: line[16],
    so: line[17],
    baopp: line[18],
    era: line[19],
    ibb: line[20],
    wp: line[21],
    hbp: line[22],
    bk: line[23],
    bfp: line[24],
    gf: line[25],
    r: line[26],
    sh: line[27],
    sf: line[28],
    gidp: line[29]
  )
end

Pitcher.all.each do |pit|
  pit.update_attributes(k_nine: ((pit.so.to_f / (pit.ipouts.to_f / 3.0)).to_f * 9.0), bb_nine: ((pit.bb.to_f / (pit.ipouts.to_f / 3.0)).to_f * 9.0))
end


# CSV.readlines("db/lahman-csv_2015-01-24/Fielding.csv", headers:true).each do |line|
#   Fielder.create(
#     playerID: line[0],
#     yearID: line[1],
#     stint: line[2],
#     teamID: line[3],
#     lgID: line[4],
#     pos: line[5],
#     g: line[6],
#     gs: line[7],
#     innouts: line[8],
#     po: line[9],
#     a: line[10],
#     e: line[11],
#     dp: line[12],
#     pb: line[13],
#     wp: line[14],
#     sb: line[15],
#     cs: line[16],
#     zr: line[17]
#   )
# end
