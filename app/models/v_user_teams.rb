# encoding: UTF-8
class VUserTeams < ActiveRecord::Base
    
  def self.find_by_tournament_and_group_and_criteria tournament_id, group_id, criteria
    VUserTeams.where(:tournament_id => tournament_id, :group_id => group_id, :criteria => criteria).order('user_name')
  end
  
  def get_result_text team1_name, team2_name
    if result == '1A'
      return team1_name + ' võidab normaalajal'
    elsif result == '1B'
      return team2_name + ' võidab normaalajal'
    elsif result == '2A'
      return team1_name + ' võidab lisaajal või penaltitega'
    elsif result == '2B'
      return team2_name + ' võidab lisaajal või penaltitega'
    end
    return ''
  end

end