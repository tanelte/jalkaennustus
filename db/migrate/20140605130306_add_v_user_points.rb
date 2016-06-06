# encoding: UTF-8
class AddVUserPoints < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW V_USER_POINTS AS
        SELECT usr.id
              ,usr.name
              ,tour.id AS tournament_id
              ,COALESCE((SELECT usre.points
                  FROM user_results usre
                 WHERE usre.user_id = usr.id
                   AND usre.tournament_id = tour.id), 0) AS points
          FROM users usr
          LEFT OUTER JOIN tournaments tour ON 1 = 1
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW V_USER_POINTS
    SQL
  end
end
