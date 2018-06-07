class UsersController < ApplicationController

def index
  @tournament_id = params[:tournament_id]
  @users = VUserPoints.find_by_tournament_and_group(@tournament_id, current_group.id)
  @users = @users.sort {|a, b| a.name == 'tegelikud tulemused' ? -1 : (b.name == 'tegelikud tulemused' ? 1 :
    (a.points.to_i == b.points.to_i ? b.name <=> a.name : a.points.to_i <=> b.points.to_i))}.reverse
end

def create
  @user = User.create(params.require(:user).permit(:name))
  @tournament_id = params[:tournament_id]
  userGroup = UserGroup.create!(:user_id => @user.id, :group_id => current_group.id)
  UserResult.create!(:user_group_id => userGroup.id, :tournament_id => @tournament_id)
  flash[:notice] = "Kasutaja #{@user.name} on lisatud."
  redirect_to tournament_users_path @tournament_id
end

  def show
    id = params[:id] # retrieve user ID from URI route
    @tournament_id = params[:tournament_id]
    @tournament = Tournament.find_by_id @tournament_id
    @user = User.find(id) # look up user by unique ID
  end
  
  def destroy
    user_id = params[:id]
    @tournament_id = params[:tournament_id]
    tournament = Tournament.find_by_id @tournament_id
    user_groups = UserGroup.where(:user_id => user_id, :group_id => current_group.id)
    if user_groups != nil
      deleted_at = tournament.created_at - 6.months;
      user_groups.each do |ug|
        ug.update_attribute(:deleted_at, deleted_at)
      end
    end
    flash[:notice] = "Kasutaja eemaldati grupist."
    redirect_to tournament_users_path @tournament_id
  end

end