class PositionsController < ApplicationController
  # before_action :set_position, only: [ :create, :destroy ]

  def show
    @project = Project.find(params[:project_id])
    @position = Position.find(params[:id])
    @user_positions = @position.user_positions
  end

  def new
    @project = Project.find(params[:project_id])
    @position = Position.new
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @position = Position.new(position_params)
    @position.status = "Open"
    @position.project = @project
    @position.save
    redirect_to project_path(@project)
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project = @position.project
    @position.destroy
    redirect_to project_path(@project)
  end

  private

  def position_params
    params.require(:position).permit(:name, :skill_level, :status, :first_skill,:second_skill,:third_skill, :rate_cents)
  end

  def set_position
    @position = Position.find(:position_id)
  end
end
