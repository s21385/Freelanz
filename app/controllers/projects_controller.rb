class ProjectsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_project, only: [:show, :edit, :update, :destroy]
before_action :find_leader_rating_count, only: [:show]

  def index
    @user = current_user
    @projects = Project.all
  end

  def new
    @user = current_user
    @project = Project.new
  end

  def show
    @rating = Rating.new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
    @project.user = @user
    if @project.save
      redirect_to project_path(@user, @project)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @project.user = @user
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@user, @project)
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

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end


  def set_rater
    @rater = current_user
  end

  def set_ratee_type
    set_project
    if current_user == @project.user
      @ratee_type = "Project Leader"
    else
      @ratee_type = "Project Contributor"
    end
  end

  def find_leader_rating_count
    set_user
    set_rater
    set_project
    @leader_rating_count = Rating.where(user_id: "%#{@project.user_id}%" && "%#{@ratee_type}%" == "Project Leader").count
    if @leader_rating_count == nil
      @leader_rating_count = 0
    end
  end

end

