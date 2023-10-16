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
    @posts = @user.posts
  end

  def notification
    @user = User.find(params[:id])
    @invitations = @user.received_invitations
  end
end
