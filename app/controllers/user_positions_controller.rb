class UserPositionsController < ApplicationController
  before_action :set_user_position

  def create
    # When a user applies for a position
    # @user_position = UserPosition.all
    @position = Position.find(params[:position_id])
    @user_position = UserPosition.new
    @user_position.user = current_user
    @user_position.position = @position
    @user_position.save
  end

  def update
    # This is for changing the status of the user_position
    # When a project own accepts or declines

    # if
    # end
  end


  private

  def user_position_params
    params.require(:user_position).permit(:status, :rate_cent)
  end

  def set_user_position
    @position = Position.find(params[:position_id])
  end
end
