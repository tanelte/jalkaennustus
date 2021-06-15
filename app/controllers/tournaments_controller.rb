class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
    initChartData
  end

  def initChartData
    userPoints = VUserPoints.where(:user_group_id => current_group.id).all
    groupUsers = User.joins(:user_groups).where(user_groups: {group_id: current_group.id, deleted_at: nil}).where.not(name: 'tegelikud tulemused')
    @points_by_tournament_chart_data = groupUsers.all.map do |user|
      data = @tournaments.map { |tournament|
        userPoint = userPoints.find { |userPoint| userPoint.tournament_id == tournament.id && userPoint.id == user.id }
        [tournament.name.delete(' '), userPoint.points]
      }.to_h
      {name: user.name, data: data}
    end
    @points_total_chart_data = groupUsers.all.map do |user|
      userPointTotal = 0
      data = @tournaments.map { |tournament|
        userPoint = userPoints.find { |userPoint| userPoint.tournament_id == tournament.id && userPoint.id == user.id }
        userPointTotal += userPoint.points
        [tournament.name.delete(' '), userPointTotal]
      }.to_h
      {name: user.name, data: data}
    end
  end

end