class Createbatters < ActiveRecord::Migration
  def change
    create_table :batters do |t|
      t.string :playerID
      t.integer :yearID
      t.integer :stint
      t.string :teamID
      t.string :lgID
      t.integer :g
      t.integer :ab
      t.integer :r
      t.integer :h
      t.integer :double
      t.integer :triple
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :cs
      t.integer :bb
      t.integer :so
      t.integer :ibb
      t.integer :hbp
      t.integer :sh
      t.integer :sf
      t.integer :gidp
    end
  end
end
