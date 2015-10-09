class CreateFielders < ActiveRecord::Migration
  def change
    create_table :fielders do |t|
      t.string :playerID
      t.integer :yearID
      t.integer :stint
      t.string :teamID
      t.integer :lgID
      t.integer :pos
      t.integer :g
      t.integer :gs
      t.integer :innouts
      t.integer :po
      t.integer :a
      t.integer :e
      t.integer :dp
      t.integer :pb
      t.integer :wp
      t.integer :sb
      t.integer :cs
      t.integer :zr
    end
  end
end
