class RemoveUserPointsCol < ActiveRecord::Migration
  def up
    remove_column :users, :points
  end

  def down
  end
end
