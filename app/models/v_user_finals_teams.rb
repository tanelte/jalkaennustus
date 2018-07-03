# encoding: UTF-8
class VUserFinalsTeams < ActiveRecord::Base

  def self.find_by_tournament_and_group tournament_id, group_id
    VUserFinalsTeams.where(:tournament_id => tournament_id, :group_id => group_id).order('user_name')
  end

end