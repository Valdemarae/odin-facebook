class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(f_params)
    @friendship.save
    redirect_to users_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    if (params[:notification])
      redirect_to notification_path(current_user.id)
    else
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(confirmed: true)
    if (params[:notification])
      redirect_to notification_path(current_user.id)
    else
      redirect_to users_path
    end
  end

  private

  def f_params
    params.require(:friendship).permit(:user_id, :another_user_id)
  end
end
