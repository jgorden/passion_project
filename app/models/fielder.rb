class Fielder < ActiveRecord::Base
  belongs_to :master, foreign_key: :playerID
  # belongs_to :batter, foreign_key: :playerID
end
