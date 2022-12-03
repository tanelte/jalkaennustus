class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_group!
  before_action :init_tournament
  before_action :init_params

  def is_change_enabled param_code, user
    @tournament_open == true && (user.name == 'tegelikud tulemused' || @sys_params.find{|param| param.code == param_code}.value.to_i == 1)
  end

  private
  
  def init_tournament
    tournament_id = params[:tournament_id]
    if tournament_id != nil
      tournament = Tournament.find_by_id(tournament_id)
      @tournament_name = tournament.name
      @tournament_open = !tournament.closed
    end
  end

  def init_params
    @sys_params = Param.all
  end
end
