class GroupsController < ApplicationController
  before_action :authenticate_user

  def create
    @group = Group.new(group_params)
    @group.user = @current_user  # Associate the group with the current user

    if @group.save
      render json: @group, status: :created
    else
      # Log the errors for better debugging
      Rails.logger.error "Failed to create group: #{@group.errors.full_messages}"
      
      render json: { error: 'Unable to create group', details: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
