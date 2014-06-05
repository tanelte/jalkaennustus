class UserTeam < ActiveRecord::Base
  
  attr_accessible :user_id, :team_id, :criteria, :tournament_id, :result
  
  def self.find_by_user_and_criteria user_id, criteria
    user_teams = UserTeam.where "user_id = :user_id and criteria = :criteria", {:user_id => user_id, :criteria => criteria}
    user_teams[0]
  end
  
end