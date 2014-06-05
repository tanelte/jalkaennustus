class AddGames2014 < ActiveRecord::Migration
  GAMES = [
    {:id => 25, :team1_id => 17, :team2_id => 18, :group => 'A', :double_points => 0, :tournament_id => 2},
    {:id => 26, :team1_id => 19, :team2_id => 20, :group => 'A', :double_points => 0, :tournament_id => 2},
    {:id => 27, :team1_id => 21, :team2_id => 22, :group => 'B', :double_points => 1, :tournament_id => 2},
    {:id => 28, :team1_id => 23, :team2_id => 24, :group => 'B', :double_points => 0, :tournament_id => 2},
    {:id => 29, :team1_id => 25, :team2_id => 26, :group => 'C', :double_points => 0, :tournament_id => 2},
    {:id => 30, :team1_id => 27, :team2_id => 28, :group => 'C', :double_points => 0, :tournament_id => 2},
    {:id => 31, :team1_id => 29, :team2_id => 30, :group => 'D', :double_points => 0, :tournament_id => 2},
    {:id => 32, :team1_id => 31, :team2_id => 32, :group => 'D', :double_points => 1, :tournament_id => 2},
    {:id => 33, :team1_id => 33, :team2_id => 34, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 34, :team1_id => 35, :team2_id => 36, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 35, :team1_id => 37, :team2_id => 38, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 36, :team1_id => 39, :team2_id => 40, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 37, :team1_id => 41, :team2_id => 42, :group => 'G', :double_points => 1, :tournament_id => 2},
    {:id => 38, :team1_id => 43, :team2_id => 44, :group => 'G', :double_points => 0, :tournament_id => 2},
    {:id => 39, :team1_id => 45, :team2_id => 46, :group => 'H', :double_points => 0, :tournament_id => 2},
    {:id => 40, :team1_id => 47, :team2_id => 48, :group => 'H', :double_points => 0, :tournament_id => 2},
    {:id => 41, :team1_id => 17, :team2_id => 19, :group => 'A', :double_points => 1, :tournament_id => 2},
    {:id => 42, :team1_id => 18, :team2_id => 20, :group => 'A', :double_points => 0, :tournament_id => 2},
    {:id => 43, :team1_id => 21, :team2_id => 23, :group => 'B', :double_points => 0, :tournament_id => 2},
    {:id => 44, :team1_id => 22, :team2_id => 24, :group => 'B', :double_points => 0, :tournament_id => 2},
    {:id => 45, :team1_id => 25, :team2_id => 27, :group => 'C', :double_points => 1, :tournament_id => 2},
    {:id => 46, :team1_id => 26, :team2_id => 28, :group => 'C', :double_points => 0, :tournament_id => 2},
    {:id => 47, :team1_id => 29, :team2_id => 31, :group => 'D', :double_points => 1, :tournament_id => 2},
    {:id => 48, :team1_id => 30, :team2_id => 32, :group => 'D', :double_points => 0, :tournament_id => 2},
    {:id => 49, :team1_id => 33, :team2_id => 35, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 50, :team1_id => 34, :team2_id => 36, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 51, :team1_id => 37, :team2_id => 39, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 52, :team1_id => 38, :team2_id => 40, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 53, :team1_id => 41, :team2_id => 43, :group => 'G', :double_points => 0, :tournament_id => 2},
    {:id => 54, :team1_id => 42, :team2_id => 44, :group => 'G', :double_points => 1, :tournament_id => 2},
    {:id => 55, :team1_id => 45, :team2_id => 47, :group => 'H', :double_points => 1, :tournament_id => 2},
    {:id => 56, :team1_id => 46, :team2_id => 48, :group => 'H', :double_points => 0, :tournament_id => 2},
    {:id => 57, :team1_id => 17, :team2_id => 20, :group => 'A', :double_points => 0, :tournament_id => 2},
    {:id => 58, :team1_id => 18, :team2_id => 19, :group => 'A', :double_points => 0, :tournament_id => 2},
    {:id => 59, :team1_id => 21, :team2_id => 24, :group => 'B', :double_points => 0, :tournament_id => 2},
    {:id => 60, :team1_id => 22, :team2_id => 23, :group => 'B', :double_points => 0, :tournament_id => 2},
    {:id => 61, :team1_id => 25, :team2_id => 28, :group => 'C', :double_points => 0, :tournament_id => 2},
    {:id => 62, :team1_id => 26, :team2_id => 27, :group => 'C', :double_points => 0, :tournament_id => 2},
    {:id => 63, :team1_id => 29, :team2_id => 32, :group => 'D', :double_points => 1, :tournament_id => 2},
    {:id => 64, :team1_id => 30, :team2_id => 31, :group => 'D', :double_points => 0, :tournament_id => 2},
    {:id => 65, :team1_id => 33, :team2_id => 36, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 66, :team1_id => 34, :team2_id => 35, :group => 'E', :double_points => 0, :tournament_id => 2},
    {:id => 67, :team1_id => 37, :team2_id => 40, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 68, :team1_id => 38, :team2_id => 39, :group => 'F', :double_points => 0, :tournament_id => 2},
    {:id => 69, :team1_id => 41, :team2_id => 44, :group => 'G', :double_points => 1, :tournament_id => 2},
    {:id => 70, :team1_id => 42, :team2_id => 43, :group => 'G', :double_points => 0, :tournament_id => 2},
    {:id => 71, :team1_id => 45, :team2_id => 48, :group => 'H', :double_points => 0, :tournament_id => 2},
    {:id => 72, :team1_id => 46, :team2_id => 47, :group => 'H', :double_points => 0, :tournament_id => 2},
  ]
  def up
    GAMES.each do |game|
      t = Game.new(game)
      t.save!
    end
  end

  def down
    GAMES.each do |game|
      Game.find_by_id(game[:id]).destroy
    end
  end
end
