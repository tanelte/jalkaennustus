class AddTeams < ActiveRecord::Migration
  TEAMS = [
    {:id => 1, :name => 'Poola', :group => 'A'},
    {:id => 2, :name => 'Kreeka', :group => 'A'},
    {:id => 3, :name => 'Venemaa', :group => 'A'},
    {:id => 4, :name => 'Tsehhi', :group => 'A'},
    {:id => 5, :name => 'Holland', :group => 'B'},
    {:id => 6, :name => 'Taani', :group => 'B'},
    {:id => 7, :name => 'Saksamaa', :group => 'B'},
    {:id => 8, :name => 'Portugal', :group => 'B'},
    {:id => 9, :name => 'Hispaania', :group => 'C'},
    {:id => 10, :name => 'Itaalia', :group => 'C'},
    {:id => 11, :name => 'Iirimaa', :group => 'C'},
    {:id => 12, :name => 'Horvaatia', :group => 'C'},
    {:id => 13, :name => 'Ukraina', :group => 'D'},
    {:id => 14, :name => 'Rootsi', :group => 'D'},
    {:id => 15, :name => 'Prantsusmaa', :group => 'D'},
    {:id => 16, :name => 'Inglismaa', :group => 'D'},
  ]
  def up
    TEAMS.each do |team|
      t = Team.new(team)
      t.save!
    end
  end

  def down
    TEAMS.each do |team|
      Team.find_by_id(team[:id]).destroy
    end
  end
end
