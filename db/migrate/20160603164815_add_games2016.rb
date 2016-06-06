class AddGames2016 < ActiveRecord::Migration
  GAMES = [
    {:id => 73, :team1_id => 52, :team2_id => 53, :group => 'A', :double_points => 0, :tournament_id => 3},
    {:id => 74, :team1_id => 51, :team2_id => 54, :group => 'A', :double_points => 0, :tournament_id => 3},
    {:id => 75, :team1_id => 58, :team2_id => 57, :group => 'B', :double_points => 0, :tournament_id => 3},
    {:id => 76, :team1_id => 55, :team2_id => 56, :group => 'B', :double_points => 1, :tournament_id => 3},
    {:id => 77, :team1_id => 66, :team2_id => 63, :group => 'D', :double_points => 0, :tournament_id => 3},
    {:id => 78, :team1_id => 61, :team2_id => 60, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 79, :team1_id => 59, :team2_id => 62, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 80, :team1_id => 65, :team2_id => 64, :group => 'D', :double_points => 0, :tournament_id => 3},
    {:id => 81, :team1_id => 69, :team2_id => 70, :group => 'E', :double_points => 0, :tournament_id => 3},
    {:id => 82, :team1_id => 67, :team2_id => 68, :group => 'E', :double_points => 1, :tournament_id => 3},
    {:id => 83, :team1_id => 71, :team2_id => 72, :group => 'F', :double_points => 0, :tournament_id => 3},
    {:id => 84, :team1_id => 74, :team2_id => 73, :group => 'F', :double_points => 0, :tournament_id => 3},
    {:id => 85, :team1_id => 56, :team2_id => 57, :group => 'B', :double_points => 0, :tournament_id => 3},
    {:id => 86, :team1_id => 53, :team2_id => 54, :group => 'A', :double_points => 0, :tournament_id => 3},
    {:id => 87, :team1_id => 52, :team2_id => 51, :group => 'A', :double_points => 0, :tournament_id => 3},
    {:id => 88, :team1_id => 55, :team2_id => 58, :group => 'B', :double_points => 0, :tournament_id => 3},
    {:id => 89, :team1_id => 62, :team2_id => 60, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 90, :team1_id => 59, :team2_id => 61, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 91, :team1_id => 68, :team2_id => 70, :group => 'E', :double_points => 1, :tournament_id => 3},
    {:id => 92, :team1_id => 64, :team2_id => 63, :group => 'D', :double_points => 0, :tournament_id => 3},
    {:id => 93, :team1_id => 65, :team2_id => 66, :group => 'D', :double_points => 1, :tournament_id => 3},
    {:id => 94, :team1_id => 67, :team2_id => 69, :group => 'E', :double_points => 0, :tournament_id => 3},
    {:id => 95, :team1_id => 73, :team2_id => 72, :group => 'F', :double_points => 0, :tournament_id => 3},
    {:id => 96, :team1_id => 74, :team2_id => 71, :group => 'F', :double_points => 1, :tournament_id => 3},
    {:id => 97, :team1_id => 53, :team2_id => 51, :group => 'A', :double_points => 0, :tournament_id => 3},
    {:id => 98, :team1_id => 54, :team2_id => 52, :group => 'A', :double_points => 1, :tournament_id => 3},
    {:id => 99, :team1_id => 56, :team2_id => 58, :group => 'B', :double_points => 0, :tournament_id => 3},
    {:id => 100, :team1_id => 57, :team2_id => 55, :group => 'B', :double_points => 0, :tournament_id => 3},
    {:id => 101, :team1_id => 62, :team2_id => 61, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 102, :team1_id => 60, :team2_id => 59, :group => 'C', :double_points => 0, :tournament_id => 3},
    {:id => 103, :team1_id => 64, :team2_id => 66, :group => 'D', :double_points => 0, :tournament_id => 3},
    {:id => 104, :team1_id => 63, :team2_id => 65, :group => 'D', :double_points => 0, :tournament_id => 3},
    {:id => 105, :team1_id => 72, :team2_id => 74, :group => 'F', :double_points => 0, :tournament_id => 3},
    {:id => 106, :team1_id => 73, :team2_id => 71, :group => 'F', :double_points => 0, :tournament_id => 3},
    {:id => 107, :team1_id => 68, :team2_id => 69, :group => 'E', :double_points => 0, :tournament_id => 3},
    {:id => 108, :team1_id => 70, :team2_id => 67, :group => 'E', :double_points => 1, :tournament_id => 3},
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
