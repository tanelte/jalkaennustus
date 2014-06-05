class UserGame < ActiveRecord::Base
  
  attr_accessible :user_id, :game_id, :result, :tournament_id
  
end