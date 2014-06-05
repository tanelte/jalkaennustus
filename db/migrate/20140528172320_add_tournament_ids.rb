class AddTournamentIds < ActiveRecord::Migration
  def up
    add_column :games, :tournament_id, :integer
    add_column :teams, :tournament_id, :integer
    add_column :user_questions, :tournament_id, :integer
    add_column :user_games, :tournament_id, :integer
    add_column :user_teams, :tournament_id, :integer
  end

  def down
    remove_column :games, :tournament_id
    remove_column :teams, :tournament_id
    remove_column :user_questions, :tournament_id
    remove_column :user_games, :tournament_id
    remove_column :user_teams, :tournament_id
  end
end
