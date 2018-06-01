class UserPositionsController < ApplicationController
  before_action :set_user_position

  def show
  end

  def create
    # When a user applies for a position
    # @user_position = UserPosition.all
    @position = Position.find(params[:position_id])
    @user_position = UserPosition.new
    @user_position.user = current_user
    @user_position.position = @position
    @user_position.save
  end

  def edit
  end

  def update
    @position = Position.find(params[:position_id])
    @user_position = UserPosition.find(params[:id])
    if @user_position.status = "Accepted" || "In review"
      @user_position.status = "Refused"
    elsif @user_position.status = "Refused"
      @user_position.status = "In review"
    end
    @user_position.status.sort
    @user_position.update(project_params)

  end


  private

  def user_position_params
    params.require(:user_position).permit(:status, :rate_cent)
  end

  def set_user_position
    @position = Position.find(params[:position_id])
  end
end
