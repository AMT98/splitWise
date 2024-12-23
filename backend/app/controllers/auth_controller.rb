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
    email = params.dig(:auth, :email) || params[:email]
    password = params.dig(:auth, :password) || params[:password]
  
    user = User.find_by(email: email)
  
    if user&.authenticate(password)
      token = encode_token({ user_id: user.id })
      puts "Generated Token: #{token}"
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
  

  private

  def user_params
    params.require(:auth).permit(:email, :password, :password_confirmation)
  end
  

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end

end
