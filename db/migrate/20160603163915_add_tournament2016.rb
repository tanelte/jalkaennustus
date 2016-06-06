class AddTournament2016 < ActiveRecord::Migration
  def up
      t = Tournament.new :id => 3, :name => 'EM 2016', :type => 'EM2016'
      t.save
  end

  def down
  end
end
