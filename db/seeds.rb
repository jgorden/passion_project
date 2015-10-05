require 'CSV'

CSV.readlines("db/lahman-csv_2015-01-24/Master.csv").each do |line|
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
