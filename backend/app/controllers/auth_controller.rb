class AuthController < ApplicationController
  skip_before_action :authenticate_user, only: [:signup, :login]
  
  def signup
    user = User.new(user_params)

    if user.save
      render json: { message: "User created successfully!", user: user }, status: :created
    else 
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: {token: token, user: user}, status: :ok
    else 
      render json: { error: "Invalid email or passowrd" }, status: unauthrorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end

end
