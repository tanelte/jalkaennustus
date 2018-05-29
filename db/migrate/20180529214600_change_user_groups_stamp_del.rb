class ChangeUserGroupsStampDel < ActiveRecord::Migration
  def up
    add_column :user_groups, :deleted_at, :timestamp
  end

  def down
    remove_column :user_groups, :deleted_at
  end
end