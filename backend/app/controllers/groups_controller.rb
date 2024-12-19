class GroupsController < ApplicationController
  before_action :authenticate_user

  def create
    @group = Group.new(group_params)
    @group.creator = @current_user 
    @group.user_id = @current_user.id 

    if @group.save
      GroupMembership.create!(user: @current_user, group: @group)
      render json: @group, status: :created
    else
      render json: { error: 'Unable to create group', details: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @groups = @current_user.groups.includes(:group_memberships)
  
    Rails.logger.info "Groups for current_user #{@current_user.id}: #{@groups.pluck(:id, :name)}"
  
    render json: @groups
  end

  def show
    @group = @current_user.groups.find(params[:id])
    render json: @group
  end

  def update
    @group = @current_user.groups.find(params[:id])  

    if @group.update(group_params)
      render json: @group, status: :ok
    else
      render json: { error: 'Unable to update group', details: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @group = @current_user.groups.find(params[:id]) 

    if @group.destroy
      render json: { message: 'Group deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete group' }, status: :unprocessable_entity
    end
  end

  def create_group
    user = User.find(params[:user_id]) 
    group = user.created_groups.create!(group_params.merge(user_id: user.id))
    render json: group, status: :created
  end

  def group_users
    @group = Group.find_by(id: params[:id])

    if @group
      user_ids = @group.users.select(:id, :email)
      total_users = user_ids.size

      render json: {
        group_name: @group.name,
        total_users: total_users,
        user_ids: user_ids
      }, status: :ok
    else
      render json: { error: 'Group not found' }, status: :not_found
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
