class ChangeUserResultsRemoveUserAndGroup < ActiveRecord::Migration
  def up
    remove_column :user_results, :user_id
    remove_column :user_results, :group_id
  end

  def down
    add_column :user_results, :user_id, :integer
    add_column :user_results, :group_id, :integer
  end
end
