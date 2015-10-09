class Createmasters < ActiveRecord::Migration
  def change
    create_table :masters do |t|
      t.string :playerID
      t.integer :birthYear
      t.integer :birthMonth
      t.integer :birthDay
      t.string :birthCountry
      t.string :birthState
      t.string :birthCity
      t.integer :deathYear
      t.integer :deathMonth
      t.integer :deathDay
      t.string :deathCountry
      t.string :deathState
      t.string :deathCity
      t.string :nameFirst
      t.string :nameLast
      t.string :nameGiven
      t.integer :weight
      t.integer :height
      t.string :bats
      t.string :throws
      t.date :debut
      t.date :finalGame
      t.integer :retroID
      t.integer :bbrefID
    end
  end
end
