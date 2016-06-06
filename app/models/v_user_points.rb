# encoding: UTF-8
class VUserPoints < ActiveRecord::Base

   attr_accessible :id, :name, :tournament_id, :points, :user_group_id
    
  def self.find_by_tournament_and_group tournament_id, group_id
    VUserPoints.where(:tournament_id => tournament_id, :user_group_id => group_id)
  end

end