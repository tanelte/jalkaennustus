class AddGames < ActiveRecord::Migration
  GAMES = [
    {:id => 1, :team1_id => 1, :team2_id => 2, :group => 'A', :double_points => 0},
    {:id => 2, :team1_id => 3, :team2_id => 4, :group => 'A', :double_points => 0},
    {:id => 3, :team1_id => 5, :team2_id => 6, :group => 'B', :double_points => 0},
    {:id => 4, :team1_id => 7, :team2_id => 8, :group => 'B', :double_points => 1},
    {:id => 5, :team1_id => 9, :team2_id => 10, :group => 'C', :double_points => 1},
    {:id => 6, :team1_id => 11, :team2_id => 12, :group => 'C', :double_points => 0},
    {:id => 7, :team1_id => 13, :team2_id => 14, :group => 'D', :double_points => 1},
    {:id => 8, :team1_id => 15, :team2_id => 16, :group => 'D', :double_points => 0},
    {:id => 9, :team1_id => 2, :team2_id => 4, :group => 'A', :double_points => 0},
    {:id => 10, :team1_id => 1, :team2_id => 3, :group => 'A', :double_points => 0},
    {:id => 11, :team1_id => 6, :team2_id => 8, :group => 'B', :double_points => 0},
    {:id => 12, :team1_id => 5, :team2_id => 7, :group => 'B', :double_points => 1},
    {:id => 13, :team1_id => 10, :team2_id => 12, :group => 'C', :double_points => 0},
    {:id => 14, :team1_id => 9, :team2_id => 11, :group => 'C', :double_points => 0},
    {:id => 15, :team1_id => 13, :team2_id => 15, :group => 'D', :double_points => 0},
    {:id => 16, :team1_id => 14, :team2_id => 16, :group => 'D', :double_points => 0},
    {:id => 17, :team1_id => 2, :team2_id => 3, :group => 'A', :double_points => 0},
    {:id => 18, :team1_id => 4, :team2_id => 1, :group => 'A', :double_points => 0},
    {:id => 19, :team1_id => 8, :team2_id => 5, :group => 'B', :double_points => 1},
    {:id => 20, :team1_id => 6, :team2_id => 7, :group => 'B', :double_points => 0},
    {:id => 21, :team1_id => 12, :team2_id => 9, :group => 'C', :double_points => 0},
    {:id => 22, :team1_id => 10, :team2_id => 11, :group => 'C', :double_points => 0},
    {:id => 23, :team1_id => 14, :team2_id => 15, :group => 'D', :double_points => 0},
    {:id => 24, :team1_id => 16, :team2_id => 13, :group => 'D', :double_points => 0},
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
