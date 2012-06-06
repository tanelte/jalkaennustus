class TeamsController < ApplicationController

  def group
    @user_id = params[:user_id]
    @groupA = Team.find_all_by_group 'A'
    @groupB = Team.find_all_by_group 'B'
    @groupC = Team.find_all_by_group 'C'
    @groupD = Team.find_all_by_group 'D'
    
    @userTeamA = UserTeam.find_by_user_and_criteria @user_id, :A3
    @userTeamB = UserTeam.find_by_user_and_criteria @user_id, :B3
    @userTeamC = UserTeam.find_by_user_and_criteria @user_id, :C3
    @userTeamD = UserTeam.find_by_user_and_criteria @user_id, :D3
  end
  
  def createGroup
    user_id = params[:user_id]
    add_or_update_user_team params[:result][:A3], :A3
    add_or_update_user_team params[:result][:B3], :B3
    add_or_update_user_team params[:result][:C3], :C3
    add_or_update_user_team params[:result][:D3], :D3
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points
    end
    redirect_to user_path(user_id)
  end
  
  def quarterfinals
    @user_id = params[:user_id]
    @userTeamQ1 = UserTeam.find_by_user_and_criteria @user_id, :Q1
    @userTeamQ2 = UserTeam.find_by_user_and_criteria @user_id, :Q2
    @userTeamQ3 = UserTeam.find_by_user_and_criteria @user_id, :Q3
    @userTeamQ4 = UserTeam.find_by_user_and_criteria @user_id, :Q4
    
    groupA = Team.find_all_by_group 'A'
    groupB = Team.find_all_by_group 'B'
    groupC = Team.find_all_by_group 'C'
    groupD = Team.find_all_by_group 'D'
    @teamsByGroup = [0, 1, 2, 3].collect{|n|[groupA[n], groupB[n], groupC[n], groupD[n]]}
  end
  
  def createQuarterfinals
    user_id = params[:user_id]
    add_or_update_user_team_with_result params[:result][:Q1], :Q1
    add_or_update_user_team_with_result params[:result][:Q2], :Q2
    add_or_update_user_team_with_result params[:result][:Q3], :Q3
    add_or_update_user_team_with_result params[:result][:Q4], :Q4
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points
    end
    redirect_to user_path(user_id)
  end
  
  def finals
    @user_id = params[:user_id]
    @teams = Team.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    
    @userTeamF1 = UserTeam.find_by_user_and_criteria @user_id, :F1
    @userTeamF2 = UserTeam.find_by_user_and_criteria @user_id, :F2
    @userTeamF3 = UserTeam.find_by_user_and_criteria @user_id, :F3
    @userTeamF4 = UserTeam.find_by_user_and_criteria @user_id, :F4
  end
  
  def createFinals
    user_id = params[:user_id]
    add_or_update_user_team params[:result][:F1], :F1
    add_or_update_user_team params[:result][:F2], :F2
    add_or_update_user_team params[:result][:F3], :F3
    add_or_update_user_team params[:result][:F4], :F4
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points
    end
    redirect_to user_path(user_id)
  end
  
  def add_or_update_user_team team_id, criteria
    if team_id != nil && !team_id.empty?
      user_id = params[:user_id]
      user_team = UserTeam.find_by_user_and_criteria user_id, criteria
      if user_team == nil
         UserTeam.create!(:user_id => user_id, :team_id => team_id, :criteria => criteria)
      else
         user_team.update_attribute(:team_id, team_id)
      end
    end
  end
  
  def add_or_update_user_team_with_result result, criteria
    if result != nil && !result.empty?
      user_id = params[:user_id]
      user_team = UserTeam.find_by_user_and_criteria user_id, criteria
      if user_team == nil
         UserTeam.create!(:user_id => user_id, :result => result, :criteria => criteria)
      else
         user_team.update_attribute(:result, result)
      end
    end
  end

end