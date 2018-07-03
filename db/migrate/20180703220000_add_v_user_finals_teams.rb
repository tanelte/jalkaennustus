class AddVUserFinalsTeams < ActiveRecord::Migration
  def up
    execute <<-SQL
      create
        or replace view public.v_user_finals_teams as select
          usgr.group_id,
          uste.tournament_id,
          usr.name as user_name,
          string_agg( substring( uste.criteria, 2 )|| '.' || team."name", ' ' order by uste.criteria ) as teams
        from
          user_teams uste
        join users usr on
          usr.id = uste.user_id
        join user_groups usgr on
          usgr.user_id = usr.id
        join teams team on
          uste.team_id = team.id
        where
          uste.criteria in(
            'F1',
            'F2',
            'F3',
            'F4'
          )
          and usr.name <> 'tegelikud tulemused'
        group by
          uste.tournament_id,
          usgr.group_id,
          usr.name
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW v_user_finals_teams
    SQL
  end
end
