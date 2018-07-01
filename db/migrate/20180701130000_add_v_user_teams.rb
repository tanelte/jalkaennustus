class AddVUserTeams < ActiveRecord::Migration
  def up
    execute <<-SQL
      create or replace view v_user_teams as
      select usgr.group_id, 
      usr."name" as user_name, 
      uste.tournament_id,
      uste.criteria,
      uste."result"
      from user_teams uste
      join users usr on usr.id = uste.user_id
      join user_groups usgr ON usgr.user_id = usr.id
      where usr.name <> 'tegelikud tulemused'
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW v_user_teams
    SQL
  end
end
