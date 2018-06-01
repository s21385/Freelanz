class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
  end

  # def position
  #   @projects = Project.find(params[:id])
  #   @positions = Position.find(:project_id)
  #   @positions = Position.all

  # end
end
