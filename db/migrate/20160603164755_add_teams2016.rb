# encoding: utf-8
class AddTeams2016 < ActiveRecord::Migration
  TEAMS = [
    {:id => 51, :name => 'Albaania', :group => 'A', :tournament_id => 3},
    {:id => 52, :name => 'Prantsusmaa', :group => 'A', :tournament_id => 3},
    {:id => 53, :name => 'Rumeenia', :group => 'A', :tournament_id => 3},
    {:id => 54, :name => 'Šveits', :group => 'A', :tournament_id => 3},
    {:id => 55, :name => 'Inglismaa', :group => 'B', :tournament_id => 3},
    {:id => 56, :name => 'Venemaa', :group => 'B', :tournament_id => 3},
    {:id => 57, :name => 'Slovakkia', :group => 'B', :tournament_id => 3},
    {:id => 58, :name => 'Wales', :group => 'B', :tournament_id => 3},
    {:id => 59, :name => 'Saksamaa', :group => 'C', :tournament_id => 3},
    {:id => 60, :name => 'Põhja Iirimaa', :group => 'C', :tournament_id => 3},
    {:id => 61, :name => 'Poola', :group => 'C', :tournament_id => 3},
    {:id => 62, :name => 'Ukraina', :group => 'C', :tournament_id => 3},
    {:id => 63, :name => 'Horvaatia', :group => 'D', :tournament_id => 3},
    {:id => 64, :name => 'Tsehhi', :group => 'D', :tournament_id => 3},
    {:id => 65, :name => 'Hispaania', :group => 'D', :tournament_id => 3},
    {:id => 66, :name => 'Türgi', :group => 'D', :tournament_id => 3},
    {:id => 67, :name => 'Belgia', :group => 'E', :tournament_id => 3},
    {:id => 68, :name => 'Itaalia', :group => 'E', :tournament_id => 3},
    {:id => 69, :name => 'Iirimaa', :group => 'E', :tournament_id => 3},
    {:id => 70, :name => 'Rootsi', :group => 'E', :tournament_id => 3},
    {:id => 71, :name => 'Austria', :group => 'F', :tournament_id => 3},
    {:id => 72, :name => 'Ungari', :group => 'F', :tournament_id => 3},
    {:id => 73, :name => 'Island', :group => 'F', :tournament_id => 3},
    {:id => 74, :name => 'Portugal', :group => 'F', :tournament_id => 3},
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
