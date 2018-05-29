class GroupsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def destroy
      @group.destroy
      redirect_to groups_path
  end

  private

  def project_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end


