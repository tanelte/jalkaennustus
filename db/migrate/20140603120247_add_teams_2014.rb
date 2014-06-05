class AddTeams2014 < ActiveRecord::Migration
  TEAMS = [
    {:id => 17, :name => 'Brasiilia', :group => 'A', :tournament_id => 2},
    {:id => 18, :name => 'Horvaatia', :group => 'A', :tournament_id => 2},
    {:id => 19, :name => 'Mehhiko', :group => 'A', :tournament_id => 2},
    {:id => 20, :name => 'Kamerun', :group => 'A', :tournament_id => 2},
    {:id => 21, :name => 'Hispaania', :group => 'B', :tournament_id => 2},
    {:id => 22, :name => 'Holland', :group => 'B', :tournament_id => 2},
    {:id => 23, :name => 'Tsiili', :group => 'B', :tournament_id => 2},
    {:id => 24, :name => 'Austraalia', :group => 'B', :tournament_id => 2},
    {:id => 25, :name => 'Kolumbia', :group => 'C', :tournament_id => 2},
    {:id => 26, :name => 'Kreeka', :group => 'C', :tournament_id => 2},
    {:id => 27, :name => 'Elevandiluurannik', :group => 'C', :tournament_id => 2},
    {:id => 28, :name => 'Jaapan', :group => 'C', :tournament_id => 2},
    {:id => 29, :name => 'Uruguay', :group => 'D', :tournament_id => 2},
    {:id => 30, :name => 'Costa Rica', :group => 'D', :tournament_id => 2},
    {:id => 31, :name => 'Inglismaa', :group => 'D', :tournament_id => 2},
    {:id => 32, :name => 'Itaalia', :group => 'D', :tournament_id => 2},
    {:id => 33, :name => 'Sveits', :group => 'E', :tournament_id => 2},
    {:id => 34, :name => 'Ecuador', :group => 'E', :tournament_id => 2},
    {:id => 35, :name => 'Prantsusmaa', :group => 'E', :tournament_id => 2},
    {:id => 36, :name => 'Honduras', :group => 'E', :tournament_id => 2},
    {:id => 37, :name => 'Argentina', :group => 'F', :tournament_id => 2},
    {:id => 38, :name => 'Bosnia ja Hertsegoviina', :group => 'F', :tournament_id => 2},
    {:id => 39, :name => 'Iraan', :group => 'F', :tournament_id => 2},
    {:id => 40, :name => 'Nigeeria', :group => 'F', :tournament_id => 2},
    {:id => 41, :name => 'Saksamaa', :group => 'G', :tournament_id => 2},
    {:id => 42, :name => 'Portugal', :group => 'G', :tournament_id => 2},
    {:id => 43, :name => 'Ghana', :group => 'G', :tournament_id => 2},
    {:id => 44, :name => 'USA', :group => 'G', :tournament_id => 2},
    {:id => 45, :name => 'Belgia', :group => 'H', :tournament_id => 2},
    {:id => 46, :name => 'Alzeeria', :group => 'H', :tournament_id => 2},
    {:id => 47, :name => 'Venemaa', :group => 'H', :tournament_id => 2},
    {:id => 48, :name => 'Korea', :group => 'H', :tournament_id => 2},
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
