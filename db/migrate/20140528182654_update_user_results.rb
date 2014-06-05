class UpdateUserResults < ActiveRecord::Migration
  def up
    User.all.each do |user|
      u = UserResult.new :user_id => user.id, :tournament_id => 1, :points => user.points
      u.save
    end
  end

  def down
  end
end
