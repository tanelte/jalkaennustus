class GamesController < ApplicationController
  
  def index
    user_id = params[:user_id]
    @tournament_id = params[:tournament_id]
    @user = User.find_by_id user_id
    @userGames = UserGame.where(:user_id => user_id, :tournament_id => @tournament_id)
    @games = Game.where(:tournament_id => @tournament_id).order('id')
    @teams = Team.find_all_by_tournament_id @tournament_id
  end

  def create
    result = params[:result]
    user_id = params[:user_id]
    tournament_id = params[:tournament_id]
    userGames = UserGame.where(:user_id => user_id, :tournament_id => tournament_id)
    result.map do |k,v|
      if v != nil && !v.empty?
        existingGames = userGames == nil ? nil : userGames.select{|userGame| k.to_i == userGame.game_id}
        if existingGames == nil || existingGames.empty?
          UserGame.create!(:user_id => user_id, :game_id => k, :result => v, :tournament_id => tournament_id)
        else
          existingGame = existingGames[0]
          existingGame.update_attribute(:result, v)
        end
      end 
    end
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points tournament_id
    end
    redirect_to tournament_user_path(tournament_id, user_id)
  end
  
end