class GroupMembershipsController < ApplicationController
  before_action :authenticate_user

  def create
    @group = Group.find_by(id: params[:group_id])
    
    unless @group
      render json: { error: 'Group not found' }, status: :not_found
      return
    end

    if @group.user != @current_user
      render json: { error: 'Only the creator can add users to the group' }, status: :forbidden
      return
    end

    user_to_add = User.find_by(email: params[:email])
    
    unless user_to_add
      send_invite_email(params[:email], @group)
      render json: { message: "User with email #{params[:email]} not found. An invitation has been sent." }, status: :unprocessable_entity
      return
    end

    if @group.users.exists?(user_to_add.id)
      render json: { error: 'User already in group' }, status: :unprocessable_entity
      return
    end

    @group_member = @group.group_memberships.new(user: user_to_add)

    if @group_member.save
      render json: @group_member, status: :created
    else
      render json: { error: 'Unable to add user to group', details: @group_member.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find_by(id: params[:group_id])
    @group_member = @group.group_memberships.find_by(user: @current_user)
  
    if @group_member&.destroy
      render json: { message: 'User removed from group' }, status: :ok
    else
      render json: { error: 'Unable to remove user from group' }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      begin
        decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
        user_id = decoded_token[0]['user_id']
        @current_user = User.find_by(id: user_id)
      rescue JWT::DecodeError
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing token' }, status: :unauthorized
    end
  end

  def send_invite_email(email, group)
    # Need to implement logic later when working in the frontend how i want to send email notification maybe use action mailer to accomplish? tbd

    Rails.logger.info "Invitation sent to #{email} for group #{group.name}"
  end
end
