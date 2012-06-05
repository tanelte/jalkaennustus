class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.string :group
      t.integer :double_points
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :games
  end
  
end
