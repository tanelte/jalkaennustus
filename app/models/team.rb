class Team < ActiveRecord::Base
  
  attr_accessible :id, :name, :group, :tournament_id
  
end