class Batter < ActiveRecord::Base
  belongs_to :master, foreign_key: :playerID
end
