class RatingsController < ApplicationController
before_action :set_user

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    set_leader_rating
    @rating.save
    redirect_to project_path(@project)
  end

  private

  def rating_params
    params.require(:rating).permit(:rater_id, :ratee_type, :rating)
  end

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_rater_id
    @user = current_user
    @rater_id = @user
  end

  def set_ratee_type
    set_project
    if current_user == @project.user
      @ratee_type = "Project Leader"
    else
      @ratee_type = "Project Contributor"
    end
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_leader_rating
    set_rater_id
    set_project
    set_ratee_type
    @rating.rater_id = @rater_id
    @rating.user_id = @project.user_id
    @rating.ratee_type = @ratee_type
  end

end

