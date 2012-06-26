class User < ActiveRecord::Base
  
  def self.calculate_points
    users = User.all
    tegelikUser = User.find_by_name 'tegelikud tulemused'
    if tegelikUser != nil
      tegelikGames = UserGame.find_all_by_user_id tegelikUser.id
      tegelikTeams = UserTeam.find_all_by_user_id tegelikUser.id
      tegelikQuestions = UserQuestion.find_all_by_user_id tegelikUser.id
      users.each do |user|
        if user.name != 'tegelikud tulemused'
          points = 0
          points = points + calculateGamePoints(user, tegelikGames)
          points = points + calculateTeamPoints(user, tegelikTeams)
          points = points + calculateQuestionPoints(user, tegelikQuestions)
          user.update_attribute(:points, points)
        end
      end
    end
  end
  
  def self.calculateGamePoints user, tegelikGames
    points = 0
    userGames = UserGame.find_all_by_user_id user.id
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
  
  def self.calculateTeamPoints user, tegelikTeams
    points = 0
    userTeams = UserTeam.find_all_by_user_id user.id
    userTeams.each do |userTeam|
      tegelikTeam = tegelikTeams.select{|t| t.criteria == userTeam.criteria}
      if tegelikTeam != nil && !tegelikTeam.empty?
        points = points + getTeamPoints(userTeam, tegelikTeam[0])
      end
      if userTeam.team_id != nil && (tegelikTeam == nil || tegelikTeam.empty? || userTeam.team_id != tegelikTeam[0].team_id) && 
        ["F1", "F2", "F3", "F4"].include?(userTeam.criteria)
        pakutud = tegelikTeams.select{|t| ["F1", "F2", "F3", "F4"].include?(t.criteria) && t.team_id == userTeam.team_id}
        if pakutud != nil && !pakutud.empty?
          points = points + 15
        end
      end
    end
    points
  end
  
  def self.getTeamPoints userTeam, tegelikTeam
    points = 0
    if userTeam.team_id != nil && userTeam.team_id == tegelikTeam.team_id
      if ["A3", "B3", "C3", "D3"].include?(userTeam.criteria)
        points = points + 10
      elsif 'F1' == userTeam.criteria
        points = points + 50
      elsif 'F2' == userTeam.criteria
        points = points + 30
      elsif 'F3' == userTeam.criteria
        points = points + 25
      elsif 'F4' == userTeam.criteria
        points = points + 20
      end
    end
    if userTeam.result != nil && userTeam.result == tegelikTeam.result
      points = points + 10
    elsif userTeam.result != nil &&  userTeam.result[1] == tegelikTeam.result[1]
      points = points + 6
    end
    points
  end
  
  def self.calculateQuestionPoints user, tegelikQuestions
    points = 0
    userQuestions = UserQuestion.find_all_by_user_id user.id
      userQuestions.each do |userQuestion|
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