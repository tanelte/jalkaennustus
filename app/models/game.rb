class Game < ActiveRecord::Base
  
  attr_accessible :id, :team1_id, :team2_id, :group, :double_points, :tournament_id
  
end