class UpdateDoublePoints < ActiveRecord::Migration
  def up
    Game.find_by_id(7).update_attribute(:double_points, 0)
    Game.find_by_id(8).update_attribute(:double_points, 1)
  end

  def down
    Game.find_by_id(8).update_attribute(:double_points, 0)
    Game.find_by_id(7).update_attribute(:double_points, 1)
  end
end
