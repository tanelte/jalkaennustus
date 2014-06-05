class CreateTournaments < ActiveRecord::Migration
  def up
    create_table :tournaments do |t|
      t.string :name
      t.string :type
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :tournaments
  end
  
end

