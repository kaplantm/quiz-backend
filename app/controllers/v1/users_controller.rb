class V1::UsersController < ApplicationController
  respond_to :json

  def index
    # @users = User.all
    # render json: @users
    render json: {
          errors: [
            {
              status: '501',
              title: 'Not Implemented',
              detail: "Will be an admin only route",
            }
          ]
        }, status: :not_implemented
  end
end