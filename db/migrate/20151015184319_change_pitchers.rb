class ChangePitchers < ActiveRecord::Migration
  def change
    rename_column :pitchers, :yearID, :year
  end
end
