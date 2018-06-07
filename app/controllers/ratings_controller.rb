class RatingsController < ApplicationController
before_action :find_rater

  def new
    @rating = Rating.new
  end

  def create
    @rating = @rater.rating.create(params[:rating])
    @rating.rateable_type =
    @rating.save
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end

  def set_user
    @user = current_user
  end

  def find_rater
    @klass = params[:rateable_type].capitalize.constantize
    @rater = klass.find(params[:rateable_id])
  end

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  # def set_rater_id
  #   @user = current_user
  #   @rater_id = @user
  # end

  # def set_ratee_type
  #   set_project
  #   if current_user == @project.user
  #     @ratee_type = "Project Leader"
  #   else
  #     @ratee_type = "Project Contributor"
  #   end
  # end

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  # def set_leader_rating
  #   set_rater_id
  #   set_project
  #   set_ratee_type
  #   @rating.rater_id = @rater_id
  #   @rating.user_id = @project.user_id
  #   @rating.ratee_type = @ratee_type
  # end

end

