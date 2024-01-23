class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
    end
  
    def create
      require 'bcrypt'
      email1 =  params[:email]
      user = User.find_by(email: email1)
      if user && user.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: user.userId)
        expires_at = Time.now + 5.minute.to_i

        return render json: { user: user, token: token, expiresAt: expires_at }, status: :ok
      else
        message = "Invalid Email or Password"
        return render json: message, status: :unprocessable_entity 
      end
    end
  
    def destroy
        message = "User logged Out."
        return render json: message, status: :ok
    end
end