class ChangeUserResults < ActiveRecord::Migration
  def up
    add_column :user_results, :group_id, :integer
  end

  def down
    remove_column :user_results, :group_id
  end
end
