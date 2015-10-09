class CreatePitchers < ActiveRecord::Migration
  def change
    create_table :pitchers do |t|
      t.string :playerID
      t.integer :yearID
      t.integer :stint
      t.string :teamID
      t.string :lgID
      t.integer :w
      t.integer :l
      t.integer :g
      t.integer :gs
      t.integer :cg
      t.integer :sho
      t.integer :sv
      t.integer :ipouts
      t.integer :h
      t.integer :er
      t.integer :hr
      t.integer :bb
      t.integer :so
      t.float :baopp
      t.float :era
      t.integer :ibb
      t.integer :wp
      t.integer :hbp
      t.integer :bk
      t.integer :bfp
      t.integer :gf
      t.integer :r
      t.integer :sh
      t.integer :sf
      t.integer :gidp
    end
  end
end
