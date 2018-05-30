class ProjectsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @projects = Project.all
  end

  def new
    @user = current_user
    @project = Project.new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
    @project.user = @user
    if @project.save
      redirect_to user_project_path(@user, @project)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @project = Project.find(params[:id])
    @project.user = @user
    @project.update(project_params)
    redirect_to user_project_path(@user, @project)
  end

  def destroy
    @user = User.find(params[:user_id])
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

