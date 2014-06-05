# encoding: UTF-8
class VUserPoints < ActiveRecord::Base

   attr_accessible :id, :name, :tournament_id, :points
    
  def self.find_by_tournament tournament_id
    VUserPoints.where(:tournament_id => tournament_id)
  end

end