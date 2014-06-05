class AddTournaments < ActiveRecord::Migration
  TOURNAMENTS = [
    {:id => 1, :name => 'EM 2012', :type => 'EM'},
    {:id => 2, :name => 'MM 2014', :type => 'MM'},
  ]
  def up    
    TOURNAMENTS.each do |tournament|
      t = Tournament.new(tournament)
      t.save!
    end
    Game.update_all :tournament_id => 1
    Team.update_all :tournament_id => 1
    UserQuestion.update_all :tournament_id => 1
    UserGames.update_all :tournament_id => 1
    UserTeams.update_all :tournament_id => 1
  end

  def down
    TOURNAMENTS.each do |tournament|
      Tournament.find_by_id(tournament[:id]).destroy
    end
    Game.update_all :tournament_id => nil
    Team.update_all :tournament_id => nil
    UserQuestion.update_all :tournament_id => nil
    UserGames.update_all :tournament_id => nil
    UserTeams.update_all :tournament_id => nil
  end
end
