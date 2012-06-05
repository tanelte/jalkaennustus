class CreateUserTeams < ActiveRecord::Migration
  def up
    create_table :user_teams do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :criteria
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :user_teams
  end
end
