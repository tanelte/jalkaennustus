class ChangeUserGroupsStampDel < ActiveRecord::Migration
  def up
    add_column :user_groups, :stamp_del, :timestamp
  end

  def down
    remove_column :user_groups, :stamp_del
  end
end