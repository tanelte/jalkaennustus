class ChangeUserResultsUserGroup < ActiveRecord::Migration
  def up
    add_column :user_results, :user_group_id, :integer
  end

  def down
    remove_column :user_results, :user_group_id
  end
end
