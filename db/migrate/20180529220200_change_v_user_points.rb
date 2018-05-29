class ChangeVUserPoints < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW V_USER_POINTS AS
        SELECT usr.id
              ,usr.name
              ,tour.id AS tournament_id
              ,COALESCE(usre.points, 0) AS points
              ,usgr.group_id AS user_group_id
          FROM users usr
          INNER JOIN user_groups usgr ON usgr.user_id = usr.id
          INNER JOIN tournaments tour ON 1 = 1
          LEFT OUTER JOIN user_results usre ON 
              usre.user_group_id = usgr.id
              AND usre.tournament_id = tour.id
          WHERE coalesce(usgr.deleted_at, current_timestamp) > tour.created_at
    SQL
  end

  def down
    execute <<-SQL
      CREATE OR REPLACE VIEW V_USER_POINTS AS
        SELECT usr.id
              ,usr.name
              ,tour.id AS tournament_id
              ,COALESCE(usre.points, 0) AS points
              ,usgr.group_id AS user_group_id
          FROM users usr
          INNER JOIN user_groups usgr ON usgr.user_id = usr.id
          LEFT OUTER JOIN tournaments tour ON 1 = 1
          LEFT OUTER JOIN user_results usre ON 
              usre.user_group_id = usgr.id
              AND usre.tournament_id = tour.id
    SQL
  end
end
