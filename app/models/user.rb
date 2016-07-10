class User < ActiveRecord::Base

  attr_accessible :name
  has_many :user_groups
  
  def self.calculate_points tournament_id, currentGroup
    users = currentGroup.users.all
    tournament = Tournament.find_by_id tournament_id
    tegelikUser = User.joins(:user_groups).where(user_groups: {group_id: currentGroup.id}, name: 'tegelikud tulemused').first
    if tegelikUser != nil
      tegelikGames = UserGame.find_all_by_user_id_and_tournament_id tegelikUser.id, tournament_id
      tegelikTeams = UserTeam.find_all_by_user_id_and_tournament_id tegelikUser.id, tournament_id
      tegelikQuestions = UserQuestion.find_all_by_user_id_and_tournament_id tegelikUser.id, tournament_id
      users.each do |user|
        if user.name != 'tegelikud tulemused'
          points = 0
          points = points + calculateGamePoints(user, tegelikGames, tournament_id)
          points = points + calculateTeamPoints(user, tegelikTeams, tournament)
          points = points + calculateQuestionPoints(user, tegelikQuestions, tournament_id)
          userGroup = UserGroup.find_by_user_id_and_group_id user.id, currentGroup.id
          userResult = UserResult.find_by_user_group_id_and_tournament_id userGroup.id, tournament_id
          if userResult != nil
            userResult.update_attribute(:points, points)
          else
            UserResult.create(:user_group_id => userGroup.id, :points => points, :tournament_id => tournament_id)
          end
        end
      end
    end
  end
  
  def self.calculateGamePoints user, tegelikGames, tournament_id
    points = 0
    userGames = UserGame.find_all_by_user_id_and_tournament_id user.id, tournament_id
    userGames.each do |userGame|
      tegelikGame = tegelikGames.select{|t| t.game_id == userGame.game_id}
      if tegelikGame != nil && !tegelikGame.empty?
        points = points + getGamePoints(userGame, tegelikGame[0])
      end
    end
    points
  end
  
  def self.getGamePoints userGame, tegelikGame
    points = 0
    if userGame.result != nil && tegelikGame.result != nil
      if userGame.result == tegelikGame.result
        points = 5
      elsif userGame.result != 'X' && userGame.result[0] == tegelikGame.result[0]
        points = 3
      end
      if Game.find_by_id(tegelikGame.game_id).double_points == 1
        points = points * 2
      end
    end
    points
  end
  
  def self.calculateTeamPoints user, tegelikTeams, tournament
    points = 0
    userTeams = UserTeam.find_all_by_user_id_and_tournament_id user.id, tournament.id
    userTeams.each do |userTeam|
      tegelikTeam = tegelikTeams.select{|t| t.criteria == userTeam.criteria}
      if tegelikTeam != nil && !tegelikTeam.empty?
        points = points + getTeamPoints(userTeam, tegelikTeam[0], tournament)
      end
      if ["F1", "F2", "F3", "F4"].include?(userTeam.criteria) && userTeam.team_id != nil && 
        (tegelikTeam == nil || tegelikTeam.empty? || userTeam.team_id != tegelikTeam[0].team_id || ["F3", "F4"].include?(userTeam.criteria))
        pakutud = tegelikTeams.select{|t| ["F1", "F2", "F3", "F4"].include?(t.criteria) && t.team_id == userTeam.team_id}
        if pakutud != nil && !pakutud.empty?
          points = points + 15
        end
      end
    end
    points
  end
  
  def self.getTeamPoints userTeam, tegelikTeam, tournament
    points = 0
    if userTeam.team_id != nil && userTeam.team_id == tegelikTeam.team_id
      if ["A3", "B3", "C3", "D3", "E3", "FA3", "G3", "H3"].include?(userTeam.criteria)
        points = points + 10
      elsif 'F1' == userTeam.criteria
        points = points + 50
      elsif 'F2' == userTeam.criteria
        points = points + 30
      end
      if !tournament.em2016
        if 'F3' == userTeam.criteria
          points = points + 25
        elsif 'F4' == userTeam.criteria
          points = points + 20
        end
      end
    end
    if userTeam.result != nil
      if ["Q1", "Q2", "Q3", "Q4"].include?(userTeam.criteria)
        if userTeam.result == tegelikTeam.result
          points = points + 10
        elsif userTeam.result[1] == tegelikTeam.result[1]
          points = points + 5
        end
      else
        if userTeam.result == tegelikTeam.result
          points = points + 8
        elsif userTeam.result[1] == tegelikTeam.result[1]
          points = points + 4
        end
      end
    end
    points
  end
  
  def self.calculateQuestionPoints user, tegelikQuestions, tournament_id
    points = 0
    userQuestions = UserQuestion.find_all_by_user_id_and_tournament_id user.id, tournament_id
      userQuestions.each do |userQuestion|
        if userQuestion.answer != nil && !userQuestion.answer.empty?
          tegelikQuestion = tegelikQuestions.select{|t| t.question_id == userQuestion.question_id}
          if tegelikQuestion != nil && !tegelikQuestion.empty?
            points = points + getQuestionPoints(userQuestion, tegelikQuestion[0])
            if userQuestion.question_id == 5
              userVaravQuestion = userQuestions.select{|t| t.question_id == 4}
              tegelikVaravQuestion = tegelikQuestions.select{|t| t.question_id == 4}
              if userVaravQuestion != nil && !userVaravQuestion.empty? && tegelikVaravQuestion != nil && !tegelikVaravQuestion.empty? && userVaravQuestion[0].answer == tegelikVaravQuestion[0].answer
                points = points + getDifference(userQuestion.answer, tegelikQuestion[0].answer)
              end
            end
          end
        end
    end
    points
  end
  
  def self.getQuestionPoints userQuestion, tegelikQuestion
    points = 0
    if [1, 2, 4].include?(userQuestion.question_id)
      if userQuestion.answer == tegelikQuestion.answer
        points = points + 10
      end
    elsif 3 == userQuestion.question_id
      points = getDifference(userQuestion.answer, tegelikQuestion.answer)
    end
    points
  end
  
  def self.getDifference num1, num2
    result = 0
    if num1 != nil && num2 != nil && is_a_number?(num1) && is_a_number?(num2)
      if num1.to_i > num2.to_i
        result = 10 - (num1.to_i - num2.to_i)
      else
        result = 10 - (num2.to_i - num1.to_i)
      end
      if result < 0
        result = 0
      end
    end
    result
  end
  
  def self.is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
  end
  
end