module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: %i[sign_in sign_up, refresh_token]

    # POST /register
    def sign_up
      @user = User.create(user_params)
    if @user.save
      response = { message: 'User created successfully'}
      render json: response, status: :created 
    else
      render json: @user.errors, status: :bad
    end 
    end

    def sign_in
      authenticate params[:email], params[:password]
    end

    def refresh_token
      refresh(request.headers["Authorization"])
    end

    def test
      render json: {
            message: 'You have passed authentication and authorization test'
          }
    end

    private

    def user_params
      params.permit(
        :name,
        :email,
        :password
      )
    end
    
    def authenticate(email, password)
      command = AuthenticateUser.call(email, password)

      if command.success?
        render json: {
          access_token: command.result[:access_token],
          refresh_token: command.result[:refresh_token],
          message: 'Login Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    def refresh(refresh_token)
      command = RefreshToken.call(refresh_token)
      if command.success?
        render json: {
          access_token: command.result[:access_token],
          refresh_token: command.result[:refresh_token],
          message: 'Token Refresh Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
  end
end
