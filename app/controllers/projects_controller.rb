class ProjectsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
      @project.destroy
      redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :short_description, :description, :deadline, :start_date)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

