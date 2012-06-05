class CreateUserGames < ActiveRecord::Migration
  def up
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :result
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :user_games
  end
end
