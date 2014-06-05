class Question < ActiveRecord::Base
  
  attr_accessible :id, :question, :tournament_id
  
end