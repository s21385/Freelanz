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
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def create
    @group = Group.new(group_params)
    @user = User.find(params[:user_id])
    if @group.save
      redirect_to user_group_path(@user, @group)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @group = Group.find(params[:id])
    @group.update(group_params)
    raise
    redirect_to user_group_path(@user, @group)
  end

  def destroy
      @user = User.find(params[:user_id])
      @group.destroy
      redirect_to user_groups_path(@user)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end


