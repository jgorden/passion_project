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
  Batter.create(
    playerID: line[0],
    yearID: line[1],
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
