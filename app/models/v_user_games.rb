# encoding: UTF-8
class VUserGames < ActiveRecord::Base

   attr_accessible :game_id, :group_id, :user_name, :result, :team1_name, :team2_name
    
  def self.find_by_game_and_group game_id, group_id
    VUserGames.where(:game_id => game_id, :group_id => group_id).order('user_name')
  end
  
  def get_result_text
    if result == '1A'
      return team1_name + ' võidab kuni kahe väravaga'
    elsif result == '1B'
      return team1_name + ' võidab vähemalt kolme väravaga'
    elsif result == '2A'
      return team2_name + ' võidab kuni kahe väravaga'
    elsif result == '2B'
      return team2_name + ' võidab vähemalt kolme väravaga'
    elsif result == 'X'
      return 'Mäng lõppeb viigiga'
    end
    return ''
  end

end