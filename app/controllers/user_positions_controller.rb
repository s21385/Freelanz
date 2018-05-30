class UserPositionsController < ApplicationController
  before_action :set_user_position

  def apply
    @user_position = UserPosition.all
  end

  def update
    # This is for changing the status of the user_position
    if
    end
  end


  private

  def user_position_params
    params.require(:user_position).permit(:status, :rate_cents)
  end

  def set_user_position
    @position = UserPosition.find(:position_id)
  end
end
