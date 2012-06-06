class GamesController < ApplicationController
  
  def index
    user_id = params[:user_id]
    @user = User.find_by_id user_id
    @userGames = UserGame.find_all_by_user_id user_id
    @games = Game.all
    @teams = Team.all
  end

  def create
    result = params[:result]
    user_id = params[:user_id]
    userGames = UserGame.find_all_by_user_id user_id
    result.map do |k,v|
      if v != nil && !v.empty?
        existingGames = userGames == nil ? nil : userGames.select{|userGame| k.to_i == userGame.game_id}
        if existingGames == nil || existingGames.empty?
          UserGame.create!(:user_id => user_id, :game_id => k, :result => v)
        else
          existingGame = existingGames[0]
          existingGame.update_attribute(:result, v)
        end
      end 
    end
    user = User.find_by_id user_id
    if user.name == 'tegelikud tulemused'
      User.calculate_points
    end
    redirect_to user_path(user_id)
  end
  
end