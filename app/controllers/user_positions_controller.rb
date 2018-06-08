class UserPositionsController < ApplicationController
  before_action :set_user_position, except: [:index, :create]
  before_action :authenticate_user!, only: [:create]

  def show
  end

  def index
    @user = current_user
    @user_positions = UserPosition.where(user_id: @user)
  end

  def create
    # When a user applies for a position
    # @user_position = UserPosition.all
    @position = Position.find(params[:position_id])
    @user_position = UserPosition.new
    @user_position.user = current_user
    @user_position.position = @position
    @user_position.status = "pending"
    @user_position.save
  end

  def edit
  end

  def update
    # @project = Project.find(params[:project_id])
    # @position = Position.find(params[:position_id])
    # This is for changing the status of the user_position
    # When a project owner accepts or declines
    @user_position.update(user_position_params)
    redirect_to dashboard_path
  end


  private

  def user_position_params
    params.require(:user_position).permit(:status, :rate_cent)
  end

  def set_user_position
    @user_position = UserPosition.find(params[:id])
  end
end
