class AddVUserGames < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW V_USER_GAMES AS
        SELECT GAME.ID       AS GAME_ID,
               USGR.GROUP_ID,
               USR.NAME      AS USER_NAME,
               USGA.RESULT,
               TEAM1.NAME    AS TEAM1_NAME,
               TEAM2.NAME    AS TEAM2_NAME
          FROM GAMES GAME
         INNER JOIN USER_GAMES USGA
            ON USGA.GAME_ID = GAME.ID
         INNER JOIN USERS USR
            ON USR.ID = USGA.USER_ID
         INNER JOIN USER_GROUPS USGR
            ON USGR.USER_ID = USR.ID
         INNER JOIN TEAMS TEAM1
            ON TEAM1.ID = GAME.TEAM1_ID
         INNER JOIN TEAMS TEAM2
            ON TEAM2.ID = GAME.TEAM2_ID
         WHERE USR.NAME != 'tegelikud tulemused'
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW V_USER_GAMES
    SQL
  end
end
