class UsersController < ApplicationController

def index
  @users = User.all.sort_by{|e| e[:points] || 0}.reverse
end

def create
    @user = User.create!(params[:user])
    flash[:notice] = "Kasutaja #{@user.name} on lisatud."
    redirect_to users_path
end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    User.all.each do |u|
      if u.name == nil || u.name.empty?
        u.destroy
      end
    end
  end
  
  def destroy
    user_id = params[:id]
    user_games = UserGame.find_all_by_user_id user_id
    user_teams = UserTeam.find_all_by_user_id user_id
    user_questions = UserQuestion.find_all_by_user_id user_id
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
    redirect_to users_path
  end

end