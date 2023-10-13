class UsersController < ApplicationController
  def index
    @users = User.all
    @friends = current_user.friends
    @sent_invitations = current_user.sent_invitations
    @received_invitations = current_user.received_invitations
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.friends
  end
end
