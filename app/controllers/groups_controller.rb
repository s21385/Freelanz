class GroupsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @groups = Group.all
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    @group = Group.new(group_params)
    @user = current_user
    if @group.save
      redirect_to group_path(@user, @group)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@user, @group)
  end

  def destroy
      @user = current_user
      @group.destroy
      redirect_to groups_path(@user)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end


