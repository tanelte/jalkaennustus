class UserQuestion < ActiveRecord::Base
  
  attr_accessible :user_id, :question_id, :answer, :tournament_id
  
end