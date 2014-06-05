class CreateUserResults < ActiveRecord::Migration
  def up
    create_table :user_results do |t|
      t.integer :user_id
      t.integer :tournament_id
      t.integer :points
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :user_results
  end
end
