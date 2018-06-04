class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @projects = current_user.projects
    @user_positions = current_user.user_positions if current_user.present?
  end

  # def position
  #   @projects = Project.find(params[:id])
  #   @positions = Position.find(:project_id)
  #   @positions = Position.all

  # end
end
