class PositionsController < ApplicationController
  before_action :set_position, only: [ :new, :create, :destroy ]

  def new
    # @project = Project.find(params[:project_id])
    @position = Position.new
  end

  def edit
  end

  def create
    # @project = Project.find(params[:project_id])
    @position = Position.new(position_params)

    @position.project = @project


    @position.save
    redirect_to position_path(@position)
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)

    redirect_to position_path(@position)
  end

  def destroy
    @project = @position.project
    @position.destroy
    redirect_to project_path(@project)
  end

  private

  def position_params
    params.require(:position).permit(:name, :skill, :experience, :rate_cents)
  end

  def set_position
    @position = Position.find(:position_id)
  end
end
