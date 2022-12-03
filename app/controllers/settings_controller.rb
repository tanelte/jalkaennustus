class SettingsController < ApplicationController
  def show
    @params = Param.all
  end

  def create
    Param.update(params[:params].keys, params[:params].values)
    redirect_to settings_path
  end
end