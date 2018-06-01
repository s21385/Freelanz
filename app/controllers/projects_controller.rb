class ProjectsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_project, only: [:show, :edit, :update, :destroy]
before_action :set_user
# before_action :find_leader_rating_count, only: [:show]

  def index
    if !user_signed_in? || params[:all]
      @projects = Project.all
    else
      @projects = Project.where(user_id: @user)
    end
  end

  def index_all
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    # @rating = Rating.new
  end

  def edit
  end

  def create
    # Issue is that we can only ever create one position
    # form is not dynamic
    @project = Project.new(project_params)
    @project.user = @user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    @project.user = @user
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
    params.require(:project).permit(:name, :short_description,
      :description, :deadline, :start_date)
  end

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end


  # def set_rater_id
  #   @rater_id = current_user
  # end

  # def set_ratee_type
  #   set_project
  #   if current_user == @project.user
  #     @ratee_type = "Project Leader"
  #   else
  #     @ratee_type = "Project Contributor"
  #   end
  # end

  # def find_leader_rating_count
  #   set_user
  #   set_rater_id
  #   set_project
  #   @leader_rating_count = Rating.where(user_id: "%#{@project.user_id}%" &&
  #     "%#{@ratee_type}%" == "Project Leader").count
  #   if @leader_rating_count == nil
  #     @leader_rating_count = 0
  #   end
  # end

end

