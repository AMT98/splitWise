class GroupsController < ApplicationController
  before_action :authenticate_user

  def create
    @group = Group.new(group_params)
    @group.user = @current_user  # Associate the group with the current user

    if @group.save
      render json: @group, status: :created
    else

      Rails.logger.error "Failed to create group: #{@group.errors.full_messages}"
      
      render json: { error: 'Unable to create group', details: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @groups = @current_user.groups
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

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
