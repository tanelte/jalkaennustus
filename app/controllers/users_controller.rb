class UsersController < ApplicationController

def index
  @tournament_id = params[:tournament_id]
  @users = VUserPoints.find_by_tournament @tournament_id
  @users = @users.sort {|a, b| a.name == 'tegelikud tulemused' ? -1 : (b.name == 'tegelikud tulemused' ? 1 :
    (a.points.to_i == b.points.to_i ? b.name <=> a.name : a.points.to_i <=> b.points.to_i))}.reverse
end

def create
    @user = User.create!(params[:user])
    @tournament_id = params[:tournament_id]
    UserResult.create!(:user_id => @user.id, :tournament_id => @tournament_id)
    flash[:notice] = "Kasutaja #{@user.name} on lisatud."
    redirect_to tournament_users_path @tournament_id
end

  def show
    id = params[:id] # retrieve user ID from URI route
    @tournament_id = params[:tournament_id]
    @tournament = Tournament.find_by_id @tournament_id
    @user = User.find(id) # look up user by unique ID
  end
  
  def destroy
    user_id = params[:id]
    user_results = UserResult.find_all_by_user_id user_id
    user_games = UserGame.find_all_by_user_id user_id
    user_teams = UserTeam.find_all_by_user_id user_id
    user_questions = UserQuestion.find_all_by_user_id user_id
    if user_results != nil
      user_results.each do |ur|
        ur.destroy
      end
    end
    if user_games != nil
      user_games.each do |ug|
        ug.destroy
      end
    end
    if user_teams != nil
      user_teams.each do |ut|
        ut.destroy
      end
    end
    if user_questions != nil
      user_questions.each do |uq|
        uq.destroy
      end
    end
    user = User.find(user_id)
    user.destroy    
    flash[:notice] = "Kasutaja '#{user.name}' kustutati."
    @tournament_id = params[:tournament_id]
    redirect_to tournament_users_path @tournament_id
  end

end