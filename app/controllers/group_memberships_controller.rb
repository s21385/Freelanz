class GroupMembershipsController < ApplicationController
  before_action :set_group_membership, except: [:index, :new, :create]

  def show
  end

  def new
    @group = Group.find(params[:group_id])
    @group_membership = GroupMembership.new
  end

  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @group_memberships = GroupMembership.where(user_id: @user)
  end

  def create
    # When a user applies for a position
    # @group_memberships = GroupMembership.all
    @group = Group.find(params[:group_id])
    @group_membership = GroupMembership.new(group_membership_params)
    @group_membership.user = current_user
    @group_membership.group = @group
    if @group.user == current_user
      @group_membership.status = "Approved"
      @group_membership.category = "Leader"
    else
      @group_membership.status = "Pending"
      @group_membership.category = "Member"
    end
    @group_membership.save
    raise
    redirect_to 'group_path(@group)'
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def delete
    @group = Group.find(params[:group_id])
  end

  def update
    # @project = Project.find(params[:project_id])
    # This is for changing the status of the user_position
    # When a project owner accepts or declines

    @group = Group.find(params[:group_id])
    @group_membership = GroupMembership.find(params[:id])
    @group_membership.update(project_params)
    raise
    redirect_to 'group_path(@group)'
  end


  private

  def group_membership_params
    params.require(:group_membership).permit(:status, :category)
  end

  def set_group_membership
    @group_membership = GroupMembership.find(params[:id])
  end
end
