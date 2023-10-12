class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(f_params)
    @friendship.save
    redirect_to users_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(confirmed: true)
    redirect_to users_path
  end

  private

  def f_params
    params.require(:friendship).permit(:user_id, :another_user_id)
  end
end
