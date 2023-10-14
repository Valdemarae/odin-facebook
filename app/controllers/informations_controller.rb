class InformationsController < ApplicationController
  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(inf_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def inf_params
    params.require(:information).permit(:description, :photo)
  end
end
