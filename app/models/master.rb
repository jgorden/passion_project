class Master < ActiveRecord::Base
  has_many :batters, foreign_key: :playerID
  # has_many :fielders, primary_key: :playerID
  has_many :pitchers, foreign_key: :playerID
end
