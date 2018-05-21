# encoding: UTF-8
class TeamsController < ApplicationController

  def group
    @tournament_id = params[:tournament_id]
    @user = User.find_by_id params[:user_id]
    @groupA = Team.find_all_by_group_and_tournament_id 'A', @tournament_id
    @groupB = Team.find_all_by_group_and_tournament_id 'B', @tournament_id
    @groupC = Team.find_all_by_group_and_tournament_id 'C', @tournament_id
    @groupD = Team.find_all_by_group_and_tournament_id 'D', @tournament_id
    
    @userTeamA = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :A3, @tournament_id
    @userTeamB = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :B3, @tournament_id
    @userTeamC = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :C3, @tournament_id
    @userTeamD = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :D3, @tournament_id
    
    @tournament = Tournament.find_by_id @tournament_id
    if @tournament.mm || @tournament.em2016
      @groupE = Team.find_all_by_group_and_tournament_id 'E', @tournament_id
      @groupF = Team.find_all_by_group_and_tournament_id 'F', @tournament_id
      
      @userTeamE = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :E3, @tournament_id
      @userTeamF = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :FA3, @tournament_id
      
      if @tournament.mm
        @groupG = Team.find_all_by_group_and_tournament_id 'G', @tournament_id
        @groupH = Team.find_all_by_group_and_tournament_id 'H', @tournament_id
        
        @userTeamG = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :G3, @tournament_id
        @userTeamH = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :H3, @tournament_id
      end
    end
  end
  
  def createGroup
    tournament_id = params[:tournament_id]
    user_id = params[:user_id]
    tournament = Tournament.find_by_id tournament_id
    user = User.find_by_id user_id
=begin
    if user.name != 'tegelikud tulemused'
      raise "Mine pekki!"
    end
=end
    add_or_update_user_team params[:result][:A3], :A3, tournament_id
    add_or_update_user_team params[:result][:B3], :B3, tournament_id
    add_or_update_user_team params[:result][:C3], :C3, tournament_id
    add_or_update_user_team params[:result][:D3], :D3, tournament_id
    if tournament.mm || tournament.em2016
      add_or_update_user_team params[:result][:E3], :E3, tournament_id
      add_or_update_user_team params[:result][:FA3], :FA3, tournament_id
      if tournament.mm
        add_or_update_user_team params[:result][:G3], :G3, tournament_id
        add_or_update_user_team params[:result][:H3], :H3, tournament_id
      end
    end
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id, current_group
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
  def roundOf16
    @tournament_id = params[:tournament_id]
    @tournament = Tournament.find_by_id @tournament_id
    @user = User.find_by_id params[:user_id]
    
    if @tournament.mm
      @teams = ['A1', 'B2', 'B1', 'A2', 'C1', 'D2', 'D1', 'C2', 'E1', 'F2', 'F1', 'E2', 'G1', 'H2', 'H1', 'G2']
    else
      @teams = ['Šveits', 'Poola', 'Horvaatia', 'Portugal', 'Wales', 'Põhja-Iirimaa', 'Ungari', 'Belgia', 'Saksamaa', 'Slovakkia', 'Itaalia', 'Hispaania', 'Prantsusmaa', 'Iirimaa', 'Inglismaa', 'Island']
    end    
    
    @userTeamR1 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R1, @tournament_id
    @userTeamR2 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R2, @tournament_id
    @userTeamR3 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R3, @tournament_id
    @userTeamR4 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R4, @tournament_id
    @userTeamR5 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R5, @tournament_id
    @userTeamR6 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R6, @tournament_id
    @userTeamR7 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R7, @tournament_id
    @userTeamR8 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :R8, @tournament_id
    
    addGroups @tournament
  end
  
  def createRoundOf16
    tournament_id = params[:tournament_id]
    user_id = params[:user_id]
    user = User.find_by_id user_id
=begin
    if user.name != 'tegelikud tulemused'
      raise "Mine pekki!"
    end
=end
    add_or_update_user_team_with_result params[:result][:R1], :R1, tournament_id
    add_or_update_user_team_with_result params[:result][:R2], :R2, tournament_id
    add_or_update_user_team_with_result params[:result][:R3], :R3, tournament_id
    add_or_update_user_team_with_result params[:result][:R4], :R4, tournament_id
    add_or_update_user_team_with_result params[:result][:R5], :R5, tournament_id
    add_or_update_user_team_with_result params[:result][:R6], :R6, tournament_id
    add_or_update_user_team_with_result params[:result][:R7], :R7, tournament_id
    add_or_update_user_team_with_result params[:result][:R8], :R8, tournament_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id, current_group
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
  def quarterfinals
    @tournament_id = params[:tournament_id]
    @user = User.find_by_id params[:user_id]
    @userTeamQ1 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :Q1, @tournament_id
    @userTeamQ2 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :Q2, @tournament_id
    @userTeamQ3 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :Q3, @tournament_id
    @userTeamQ4 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :Q4, @tournament_id
    
    @tournament = Tournament.find_by_id @tournament_id
    @team1 = @tournament.em2016 ? 'Šveits/Poola' : (@tournament.mm ? 'A1/B2' : 'A1')
    @team2 = @tournament.em2016 ? 'Horvaatia/Portugal' : (@tournament.mm ? 'C1/D2' : 'B2')
    @team3 = @tournament.em2016 ? 'Wales/Põhja-Iirimaa' : (@tournament.mm ? 'B1/A2' : 'B1')
    @team4 = @tournament.em2016 ? 'Ungari/Belgia' : (@tournament.mm ? 'D1/C2' : 'A2')
    @team5 = @tournament.em2016 ? 'Saksamaa/Slovakkia' : (@tournament.mm ? 'E1/F2' : 'C1')
    @team6 = @tournament.em2016 ? 'Itaalia/Hispaania' : (@tournament.mm ? 'G1/H2' : 'D2')
    @team7 = @tournament.em2016 ? 'Prantsusmaa/Iirimaa' : (@tournament.mm ? 'F1/E2' : 'D1')
    @team8 = @tournament.em2016 ? 'Inglismaa/Island' : (@tournament.mm ? 'H1/G2' : 'C2')
    
    addGroups @tournament
  end
  
  def addGroups tournament
    groupA = Team.find_all_by_group_and_tournament_id 'A', tournament.id
    groupB = Team.find_all_by_group_and_tournament_id 'B', tournament.id
    groupC = Team.find_all_by_group_and_tournament_id 'C', tournament.id
    groupD = Team.find_all_by_group_and_tournament_id 'D', tournament.id
    if tournament.mm || tournament.em2016
      groupE = Team.find_all_by_group_and_tournament_id 'E', tournament.id
      groupF = Team.find_all_by_group_and_tournament_id 'F', tournament.id
      if tournament.mm
        groupG = Team.find_all_by_group_and_tournament_id 'G', tournament.id
        groupH = Team.find_all_by_group_and_tournament_id 'H', tournament.id
        @teamsByGroup = [0, 1, 2, 3].collect{|n|[groupA[n], groupB[n], groupC[n], groupD[n], groupE[n], groupF[n], groupG[n], groupH[n]]}
      else
        @teamsByGroup = [0, 1, 2, 3].collect{|n|[groupA[n], groupB[n], groupC[n], groupD[n], groupE[n], groupF[n]]}
      end
    else
      @teamsByGroup = [0, 1, 2, 3].collect{|n|[groupA[n], groupB[n], groupC[n], groupD[n]]}
    end
  end
  
  def createQuarterfinals
    tournament_id = params[:tournament_id]
    user_id = params[:user_id]
    user = User.find_by_id user_id
=begin
    if user.name != 'tegelikud tulemused'
      raise "Mine pekki!"
    end
=end
    add_or_update_user_team_with_result params[:result][:Q1], :Q1, tournament_id
    add_or_update_user_team_with_result params[:result][:Q2], :Q2, tournament_id
    add_or_update_user_team_with_result params[:result][:Q3], :Q3, tournament_id
    add_or_update_user_team_with_result params[:result][:Q4], :Q4, tournament_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id, current_group
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
  def finals
    @tournament_id = params[:tournament_id]
    @user = User.find_by_id params[:user_id]
    @teams = Team.find_all_by_tournament_id(@tournament_id).sort! { |a,b| a.name.downcase <=> b.name.downcase }
    
    @userTeamF1 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :F1, @tournament_id
    @userTeamF2 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :F2, @tournament_id
    @userTeamF3 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :F3, @tournament_id
    @userTeamF4 = UserTeam.find_by_user_id_and_criteria_and_tournament_id @user.id, :F4, @tournament_id
  end
  
  def createFinals
    tournament_id = params[:tournament_id]
    user_id = params[:user_id]
    user = User.find_by_id user_id
=begin
    if user.name != 'tegelikud tulemused'
      raise "Mine pekki!"
    end
=end
    add_or_update_user_team params[:result][:F1], :F1, tournament_id
    add_or_update_user_team params[:result][:F2], :F2, tournament_id
    add_or_update_user_team params[:result][:F3], :F3, tournament_id
    add_or_update_user_team params[:result][:F4], :F4, tournament_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id, current_group
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
  def add_or_update_user_team team_id, criteria, tournament_id
    user_id = params[:user_id]
    user_team = UserTeam.find_by_user_id_and_criteria_and_tournament_id user_id, criteria, tournament_id
    if (team_id != nil && !team_id.empty?) && user_team == nil
       UserTeam.create!(:user_id => user_id, :team_id => team_id, :criteria => criteria, :tournament_id => tournament_id)
    elsif user_team != nil
       user_team.update_attribute(:team_id, team_id)
    end
  end
  
  def add_or_update_user_team_with_result result, criteria, tournament_id
    user_id = params[:user_id]
    user_team = UserTeam.find_by_user_id_and_criteria_and_tournament_id user_id, criteria, tournament_id
    if (result != nil && !result.empty?) && user_team == nil
       UserTeam.create!(:user_id => user_id, :result => result, :criteria => criteria, :tournament_id => tournament_id)
    elsif user_team != nil
       user_team.update_attribute(:result, result)
    end
  end

end