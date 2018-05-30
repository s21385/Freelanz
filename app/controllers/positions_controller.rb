class PositionsController < ApplicationController
  dsdfsd dependent: :destroy

  def new
    @position = Position.new
  end

  def show
    @position = Position.find(params[:project_id])
  end

  def edit
  end

  def create
    @project.user = current_user
    @position = Position.new(position_params)
    @project.user = current_user
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    redirect_to position_path(@position)
  end

  def destroy
      @position.destroy
      redirect_to projects_path
  end

  private

  def position_params
    params.require(:position).permit(:name, :skill, :experience, :rate)
  end

  def set_position
    @position = Position.find(:project_id)
  end
end
