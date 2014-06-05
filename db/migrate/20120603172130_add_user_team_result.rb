class AddUserTeamResult < ActiveRecord::Migration
  def up
    add_column :user_teams, :result, :string
  end

  def down
    remove_column :user_teams, :result
  end
end
