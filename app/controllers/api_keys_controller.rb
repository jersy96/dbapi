class ApiKeysController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
      api_key = ApiKey.create(user_id: user.id)
      render json: api_key
    else
      render json: {user: "any user has the email #{params[:email]}"}
    end
  end
end
